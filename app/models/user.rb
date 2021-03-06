class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が無効です。文字と数字を含めてください。'
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角文字で入力してください。' } do
    validates :famiry_name
    validates :first_name
  end
  with_options presence: true,
               format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶ一-]+\z/,
                         message: 'は全角カナで入力してください' } do
    validates :famiry_name_kana
    validates :first_name_kana
  end

  has_many :items
  has_many :orders
end
