# frozen_string_literal: true

RSpec.describe Parcel do
  describe '#update_status' do
    subject { parcel.update_status(new_status) }

    let(:parcel) { described_class.create(status: old_status) }

    {
      %w(pre_shipped in_transit) => 'in_transit',
      %w(in_transit completed) => 'completed',
    }.each do |transition, _expected_status|
      context "with valid transition from #{transition.first} to #{transition.last}" do
        let(:old_status) { transition.first }
        let(:new_status) { transition.last }

        it 'updates status' do
          subject

          expect(parcel.status).to eq(new_status)
        end
      end
    end

    {
      %w(pre_shipped completed) => 'pre_shipped',
      %w(completed in_transit) => 'completed',
      %w(completed pre_shipped) => 'completed',
      %w(in_transit pre_shipped) => 'in_transit',
    }.each do |transition, expected_status|
      context "with invalid transition from #{transition.first} to #{transition.last}" do
        let(:old_status) { transition.first }
        let(:new_status) { transition.last }

        it 'does not update status' do
          # Insert your code here
          subject

          expect(parcel.status).to eq(expected_status)
        end
      end
    end
  end
end
