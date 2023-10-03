module PublicIdable
  extend ActiveSupport::Concern

  # _ and - characters are excluded for nicer URLs
  ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
  SIZE = 12

  included do
    before_create :set_public_id

    def self.find(identifier)
      find_by(public_id: identifier) || super(identifier)
    end
  end

  def set_public_id(generator: Nanoid)
    self.public_id = generate_free_nano_id(generator:)
  end

  def to_param
    public_id
  end

  private

  def generate_free_nano_id(generator:)
    loop do
      nano_id = generator.generate(size: SIZE, alphabet: ALPHABET)
      return nano_id unless self.class.exists?(public_id: nano_id)
    end
  end
end
