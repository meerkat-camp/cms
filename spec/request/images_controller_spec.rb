require 'rails_helper'

describe ImagesController, type: :request do
  before do
    host!("#{site.internal_subdomain}.meerkat.camp")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(create(:user,
                                                                                             sites: [site]))
  end

  let(:site) { create(:site) }

  describe 'GET #show' do
    let(:image) { create(:image, site:) }

    it 'returns the image' do
      get image_path(image)

      expect(response.body).to eql(image.file.download)
    end
  end

  describe 'POST #create' do
    it 'creates a new image' do
      post = create(:post, site:)
      params = {
        image: fixture_file_upload('10x10.jpg', 'image/jpeg'),
        imageable_type: 'post',
        imageable_id: post.id
      }
      expect do
        post(images_path, params:)
      end.to change { site.images.count }.by(1)

      expect(response).to be_successful

      expect(site.images.last.imageable).to eql(post)

      expect(JSON.parse(response.body)).to eql(
        { "success" => 1, "file" => { "url" => url_for(site.images.last) } }
      )
    end
  end

  describe 'POST #from_url', :vcr do
    let(:remote_url) { 'https://www.example.com/1.jpg' }

    context 'with working remote url' do
      before do
        stub_request(:get, remote_url).to_return(body: file_fixture('10x10.jpg').read)
      end

      it 'creates a new image' do
        expect do
          post(from_url_images_path, params: { url: remote_url })
        end.to change { site.images.count }.by(1)

        expect(response).to be_successful

        expect(JSON.parse(response.body)).to eql(
          { "success" => 1, "file" => { "url" => url_for(site.images.last) } }
        )
      end
    end

    context 'with failing remote url' do
      before do
        stub_request(:get, remote_url).to_return(status: [500, "Internal Server Error"])
      end

      it 'returns a failed image response' do
        post(from_url_images_path, params: { url: remote_url })

        expect(response).to be_successful

        expect(JSON.parse(response.body)).to eql({ "success" => 0 })
      end
    end
  end
end
