class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :address_line1, :tell, :token

  with_options presence: true do
  validates :postal_code,format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :address
  validates :tell, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  validates :token
  validates :user_id
  validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(order_id: order.id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, address: address,
                   address_line1: address_line1, tell: tell)
  end
end
