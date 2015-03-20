class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  validate :original_text_is_different_from_translated

  before_create do
    self.review_date = Date.today + 3
  end

  private
    def original_text_is_different_from_translated
      if original_text.mb_chars.downcase == translated_text.mb_chars.downcase
        errors[:base] << "оригинал и перевод не могут совпадать"
      end
    end
end
