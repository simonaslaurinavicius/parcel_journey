# frozen_string_literal: true

FactoryBot.define do
  factory :parcel do
    status { 'pre_shipped' }
    association :sender, factory: :person
    association :recipient, factory: :person
  end
end
