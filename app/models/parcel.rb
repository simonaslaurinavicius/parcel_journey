# frozen_string_literal: true

class Parcel < ApplicationRecord
  enum status: {
    pre_shipped: 'pre_shipped',
    in_transit: 'in_transit',
    completed: 'completed',
  }
end
