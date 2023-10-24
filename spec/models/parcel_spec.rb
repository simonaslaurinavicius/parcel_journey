# frozen_string_literal: true

RSpec.describe Parcel do
  describe '#update_status' do
    subject # { insert your code here }

    # Refactor valid transition test cases using subject, context and let variables
    it 'updates status from pre_shipped to in_transit' do
      parcel = Parcel.create!(status: 'pre_shipped')

      parcel.update_status('in_transit')

      expect(parcel.status).to eq('in_transit')
    end

    it 'updates status from in_transit to completed' do
      parcel = Parcel.create!(status: 'in_transit')

      parcel.update_status('completed')

      expect(parcel.status).to eq('completed')
    end

    # Refactor invalid transition test cases using subject, context and let variables
    it 'does not update status from pre_shipped to completed' do
      parcel = Parcel.create!(status: 'pre_shipped')

      parcel.update_status('completed')

      expect(parcel.status).to eq('pre_shipped')
    end

    it 'does not update status from completed to in_transit' do
      parcel = Parcel.create!(status: 'completed')

      parcel.update_status('in_transit')

      expect(parcel.status).to eq('completed')
    end

    it 'does not update status from completed to pre_shipped' do
      parcel = Parcel.create!(status: 'completed')

      parcel.update_status('pre_shipped')

      expect(parcel.status).to eq('completed')
    end

    it 'does not update status from in_transit to pre_shipped' do
      parcel = Parcel.create!(status: 'in_transit')

      parcel.update_status('pre_shipped')

      expect(parcel.status).to eq('in_transit')
    end
  end
end
