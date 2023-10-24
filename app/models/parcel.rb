# frozen_string_literal: true

class Parcel < ApplicationRecord
  enum status: {
    pre_shipped: 'pre_shipped',
    in_transit: 'in_transit',
    completed: 'completed',
  }

  belongs_to :sender, class_name: 'Person', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'Person', foreign_key: 'recipient_id'

  HAPPY_PATH = {
    'pre_shipped' => 'in_transit',
    'in_transit' => 'completed',
  }.freeze

  def update_status(new_status)
    return if status == new_status

    if supported_transition?(status, new_status)
      update!(status: new_status)
    else
      Rails.logger.error("Illegal transition from #{status} to #{new_status}!")
    end
  end

  private

  def supported_transition?(old, new)
    return false if final?(old)

    HAPPY_PATH[old] == new
  end

  def final?(status)
    %w(completed).include?(status)
  end
end
