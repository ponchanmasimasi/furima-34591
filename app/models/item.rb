class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :preparation

  with_options presence: true do
    validates :name
    validates :explanation
    validates :value
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :preparation_id
  end

  validates :value,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is invalid' }
end
