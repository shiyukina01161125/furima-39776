class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :delivery_area_id, :municipality, :street_address, :building_name, :telephone_number, :order_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipality
    validates :street_address
    validates :telephone_number, numericality: { only_integer: true, message: "is invalid."},length: { minimum: 10, maximum: 11 }
    validates :token
  end
  
  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, municipality: municipality, street_address: street_address, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
