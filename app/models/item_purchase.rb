class ItemPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :subscriber

  # attr_accessor :token
  # validates :token, presence: true
end
