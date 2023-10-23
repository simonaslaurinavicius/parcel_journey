# frozen_string_literal: true

class AddRecipientSenderRefsToParcels < ActiveRecord::Migration[7.0]
  def change
    add_reference :parcels, :recipient, null: false, foreign_key: { to_table: :people }
    add_reference :parcels, :sender, null: false, foreign_key: { to_table: :people }
  end
end
