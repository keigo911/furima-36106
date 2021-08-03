FactoryBot.define do
  factory :item do
    products {'画像'}
    products_description {Faker::Lorem.sentence}
    category_id { '2' }
    status_id { '2' }
    fee_burden_id { '2' }
    prefecture_id { '2' }
    delivery_time_id { '2' }
    price { '1000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
