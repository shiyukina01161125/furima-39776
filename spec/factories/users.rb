FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name            { Gimei.family.kanji }
    first_name             { Gimei.given.kanji }
    family_name_kana       { Gimei.family.katakana }
    first_name_kana        { Gimei.given.katakana }
    birthday             { Faker::Date.birthday }
  end
end