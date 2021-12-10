class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :pay_for_shipping
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :pay_for_shipping_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
end
