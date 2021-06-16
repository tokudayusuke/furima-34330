FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {Faker::Internet.email }
    last_name {"田中"}
    last_name_kana {"タナカ"}
    first_name {"太郎"}
    first_name_kana {"タロウ"}
    password {"111aaa"}
    password_confirmation {"111aaa"}
    birthday {"1111-01-01"}
  end
end
