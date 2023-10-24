# frozen_string_literal: true

RSpec.describe Parcel do
  describe '#update_status' do
    subject { Parcel.create!(status: old_status) }

    {
      %w(pre_shipped in_transit) => 'in_transit',
      %w(in_transit completed) => 'completed',
    }.each do |(old_status, new_status), expected_status|
      context "with valid transition from #{old_status} to #{new_status}" do
        subject { Parcel.create!(status: old_status) }

        it 'updates status' do
          subject.update_status(new_status)

          expect(subject.status).to eq(expected_status)
        end
      end
    end

    {
      %w(pre_shipped completed) => 'pre_shipped',
      %w(completed in_transit) => 'completed',
      %w(completed pre_shipped) => 'completed',
      %w(in_transit pre_shipped) => 'in_transit',
    }.each do |(old_status, new_status), expected_status|
      context "with invalid transition from #{old_status} to #{new_status}" do
        subject { Parcel.create!(status: old_status) }

        it 'does not update status' do
          # Insert your code here
          subject.update_status(new_status)

          expect(subject.status).to eq(expected_status)
        end
      end
    end

    Parcel.statuses.values.each do |status|
      context 'when status did not change' do
        subject { Parcel.create!(status: status) }

        it 'does not update status' do
          subject.update_status(status)

          expect(subject.status).to eq(status)
        end
      end
    end
  end
end
