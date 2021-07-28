class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  with_options presence: true do
  validates :password, length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birthday
  end
end
