class Card < ActiveRecord::Base
  before_validation :set_review_date

  validates :original_text, :translated_text, :review_date, presence: true
  validate :original_text_is_different_from_translated

  def original_text_is_different_from_translated
    if original_text.mb_chars.downcase == translated_text.mb_chars.downcase
       errors[:base] << "оригинал и перевод не могут совпадать"
    end
  end

  private

    def set_review_date
      self.review_date = Date.today + 3
    end
end
