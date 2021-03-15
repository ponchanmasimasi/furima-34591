class ItemPurchasesForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :phone_number, :building_name, :address, :item_id, :user_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    item_purchases = ItemPurchase.create(item_id: item_id, user_id: user_id)

    Subscriber.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number,
                      building_name: building_name, address: address, item_purchase_id: item_purchases.id)
  end
end
