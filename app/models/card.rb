class Card < ActiveRecord::Base

  validates :original_text, :translated_text, :review_date, presence: true
  validate :the_same_text

  def the_same_text
    if original_text.downcase == translated_text.downcase
       errors[:base] << "оригинал и перевод не могут совпадать"
    end
  end

  before_validation :set_review_date

  private
    def set_review_date
      self.review_date = Date.today + 3
    end
end
