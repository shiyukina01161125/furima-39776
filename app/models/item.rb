class Item < ApplicationRecord
  has_one_attached :item_image
  belongs_to :user

  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :item_image, presence: true

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_situation_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_day_id
  end

  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :item_situation
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day
end
