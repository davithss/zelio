# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    name { Faker::Name.first_name }
    sequence(:email) { |n| "zelio_admin_#{n}@aguasdearuanda.com.br" }
    password { '1234567890' }
  end
end
