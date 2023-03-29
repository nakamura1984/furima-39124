FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    double_byte_first_name{'太郎'}
    double_byte_last_name{'山田'}
    double_byte_first_name_kana{'タロウ'}
    double_byte_last_name_kana{'ヤマダ'}
    date_of_birth{"1980-1-1"}

  end
end