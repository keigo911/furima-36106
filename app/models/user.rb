class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buys

  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ }
      validates :last_name_kana
      validates :first_name_kana
    end  
  end
end