FactoryBot.define do
  factory :item do
    name { 'テスト' }
    detail { 'テスト' }
    shipping_cost_id { 2 }
    category_id { 2 }
    condition_id { 2 }
    area_of_origin_id { 2 }
    estimated_sipping_date_id { 2 }
    selling_price { 300 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/jpg')
    end
    association :user
  end
end
