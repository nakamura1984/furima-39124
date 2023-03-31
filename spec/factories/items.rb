FactoryBot.define do
  factory :item do
    name {'テスト'}
    detail {'太郎'}
    category_id {'山田'}
    condition_id {'タロウ'}
    shipping_cost_id {'ヤマダ'}
    area_of_origin_id {"1980-1-1"}
    estimated_sipping_date_id {'テスト'}
    selling_price{"300"}
    after(:build) do |item|
      item.images.attach(io: File.open('pubic/images/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
