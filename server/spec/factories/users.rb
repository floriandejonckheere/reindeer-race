# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Internet.user_name }
  end
end
