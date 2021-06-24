FactoryBot.define do
  factory :user do
nickname                 {"test"}
email                    {Faker::Internet.free_email}
password                 { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
password_confirmation    {password}
last_name_zenkaku        {"山田"}
last_name_kana_zenkaku {"ヤマダ"}
first_name_zenkaku       {"太郎"}
first_name_kana_zenkaku  {"タロウ"}
birthday                 {"2000-01-01"}
end
end