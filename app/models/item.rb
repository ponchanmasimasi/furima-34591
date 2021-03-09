class Item < ApplicationRecord
  belongs_to :user
  # has_one :item_purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name
    validates :explanation
    validates :value
    validates :image
  end

  with_options numericality: { other_than: 0} do
    validates :category_id
    validates :condition_id
    validates :postage_type_id
    validates :prefecture_id
    validates :preparation_day_id
  end

    validates :value, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 999999, message: "is invalid"}
end
