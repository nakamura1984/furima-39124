class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area_of_origin
  belongs_to :shipping_cost
  belongs_to :estimated_sipping_date
  belongs_to :condition

  validates :area_of_origin_id, numericality: { other_than: 1, message: 'Select'}
  validates :category_id, numericality: { other_than: 1, message: 'Select'}
  validates :condition_id, numericality: { other_than: 1, message: 'Select'}
  validates :estimated_sipping_date_id, numericality: { other_than: 1, message: 'Select'}
  validates :shipping_cost_id, numericality: { other_than: 1, message: 'Select'}
  validates :name, presence: true
  validates :detail, presence: true
  validates :image, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :selling_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                     presence: { message: "can't be blank "}
  end
end
