class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         #<%#DB設計ブランチで先に設定した部分を、ユーザー管理機能実装時差分として上げるためコメントアウトしております%>
         #validates :nickname, presence: true
         #validates :first_name, presence: true
         #validates :family_name, presence: true
         #validates :read_first, presence: true
         #validates :read_family, presence: true
         #validates :birth
       
         #has_many :items
         #has_many :item_purchases
         #has_many :subscribers
         
         
end
