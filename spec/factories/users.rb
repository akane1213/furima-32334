FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {"sample@gmail.com"}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"中塚"}
    last_name {"朱音"}
    first_name_kana {"ナカツカ"}
    last_name_kana {"アカネ"}
    birthday {"1998-12-13"}
  end
end