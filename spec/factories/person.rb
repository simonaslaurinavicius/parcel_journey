# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    first_name { 'John' }
    last_name { 'Doe' }
  end
end
