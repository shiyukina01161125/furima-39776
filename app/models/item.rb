class Item < ApplicationRecord
  has_one_attached :item_image
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category, class_name: 'Category', foreign_key: 'category_id'
  belongs_to :item_situation, class_name: 'ItemSituation', foreign_key: 'item_situation_id'
  belongs_to :delivery_charge, class_name: 'DeliveryCharge', foreign_key: 'delivery_charge_id'
  belongs_to :delivery_area, class_name: 'DeliveryArea', foreign_key: 'delivery_area_id'
  belongs_to :delivery_day, class_name: 'DeliveryDay', foreign_key: 'delivery_day_id'
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end