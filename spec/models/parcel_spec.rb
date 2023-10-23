# frozen_string_literal: true

RSpec.describe Parcel do
  describe '#update_status' do
    subject { Parcel.create!(status: old_status) }

    # Reduce duplication by using table tests
    context 'with transition from pre_shipped to in_transit' do
      let(:old_status) { 'pre_shipped' }
      let(:new_status) { 'in_transit' }

        it 'updates status' do
          subject.update_status(new_status)

          expect(subject.status).to eq(expected_status)
        end
      end
    end

    context 'with transition from pre_shipped to completed' do
      let(:old_status) { 'pre_shipped' }
      let(:new_status) { 'completed' }

        it 'does not update status' do
          # Insert your code here
          subject.update_status(new_status)

          expect(subject.status).to eq(expected_status)
        end
      end
    end
  end
end
