describe IconComponent, type: :component do
  it 'renders an icon' do
    render_inline(described_class.new(name: 'home'))
    expect(page).to have_css('i.bi.bi-home')
  end
end
