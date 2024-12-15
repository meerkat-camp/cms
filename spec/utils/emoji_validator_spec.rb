describe 'EmojiValidator' do
  describe '#validate_each' do
    subject(:validator) { EmojiValidator.new(attributes: :emoji) }

    let(:record) { instance_spy(Site, errors:) }
    let(:errors) { instance_spy(ActiveModel::Errors) }

    context 'when the value is a valid emoji' do
      it 'does not add an error' do
        validate_emoji!('👍')

        expect(errors).not_to have_received(:add)
      end
    end

    context 'when the value is not a valid emoji' do
      it 'adds an error' do
        validate_emoji!('not an emoji')
        expect(errors).to have_received(:add).with(
          :emoji,
          I18n.t('activerecord.errors.messages.invalid_emoji')
        )
      end
    end

    context 'when the value is blank' do
      it 'does not add an error' do
        validate_emoji!('')
        expect(errors).not_to have_received(:add)
      end
    end

    private

    def validate_emoji!(text)
      validator.validate_each(record, :emoji, text)
    end
  end
end
