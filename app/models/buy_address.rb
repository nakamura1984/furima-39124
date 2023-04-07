class BuyAddress
  include ActiveModel::Model
  attr_accessor :municipality, :address, :area_of_origin_id, :post_code, :telephone_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :address
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid. "}
    validates :area_of_origin_id, numericality: { other_than: 1, message: 'Select'}
    validates :municipality
    validates :user_id
    validates :item_id
  end



  def save
    buy = Buy.create(
      user_id: user_id, item_id: item_id
    )

    Address.create(
    buy_id: buy.id,
    municipality: municipality,
    area_of_origin_id: area_of_origin_id,
    building_name: building_name,
    telephone_number: telephone_number,
    address: address,
    post_code: post_code
    )
  end
end