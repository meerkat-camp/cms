describe Api::CaddyController do
  describe '#allowed_domain' do
    context 'for a site hosted by us' do
      let(:deployment_target) do
        create(:deployment_target, :staging)
      end

      it 'returns an :ok' do
        get '/api/caddy/check_domain', params: { domain: deployment_target.public_hostname }

        expect(response).to have_http_status(:ok)
      end
    end

    context 'for a site hosted by someone els' do
      let(:deployment_target) do
        create(:deployment_target, :fastmail)
      end

      it 'returns a :not_found' do
        get '/api/caddy/check_domain', params: { domain: deployment_target.public_hostname }

        expect(response).to have_http_status(:not_found)
      end
    end

    context 'for a unknown site' do
      it 'returns a :not_found' do
        get '/api/caddy/check_domain', params: { domain: 'example.com' }

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
