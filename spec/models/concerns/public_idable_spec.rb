describe PublicIdable do
  it 'sets a public id on create' do
    user = create(:user)

    expect(user.public_id).to be_present
  end

  it 'finds by public id and id' do
    user = create(:user)

    expect(User.find(user.public_id)).to eq(user)
    expect(User.find(user.id)).to eq(user)
  end

  it 'avoids collisions' do
    user_a = create(:user)

    nano_id = class_spy(Nanoid)
    allow(nano_id).to receive(:generate).and_return(
      user_a.public_id, 'anotherid012'
    )

    user_b = User.new
    user_b.set_public_id(generator: nano_id)
    expect(user_b.public_id).to eq('anotherid012')
  end

  it 'implements to_param and returns public_id instead of id' do
    user = create(:user)

    expect(user.to_param).to eq(user.public_id)
  end
end
