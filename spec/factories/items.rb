FactoryBot.define do
  factory :item do 
    name                 {"test"}
   
    category_id        {2}
    explanation    {"test"}
    status_id        {2}
    delivery_charge_id {2}
    prefecture_id       {2}
    scheduled_day_id  {2}
    price                 {"111111"}



    association :user 

    #imageのファクトリーボット
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end

  end
end
