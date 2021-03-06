class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :read_first, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :read_family, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth, presence: true

  has_many :item
  has_many :item_purchases
end
