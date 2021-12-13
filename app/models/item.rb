class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :pay_for_shipping
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :product_condition_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :pay_for_shipping_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "を入力してください" }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円から10000000円までで入力してください' }
end
