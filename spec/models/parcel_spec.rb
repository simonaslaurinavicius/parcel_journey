# frozen_string_literal: true

RSpec.describe Parcel do
  describe '#update_status' do
    subject { parcel.update_status(new_status) }

    let(:parcel) { Parcel.create(status: old_status) }

    # Reduce duplication by using table tests
    context 'with transition from pre_shipped to in_transit' do
      let(:old_status) { 'pre_shipped' }
      let(:new_status) { 'in_transit' }

      it 'updates status' do
        subject

        expect(parcel.status).to eq(new_status)
      end
    end

    context 'with transition from in_transit to completed' do
      let(:old_status) { 'in_transit' }
      let(:new_status) { 'completed' }

      it 'updates status' do
        subject

        expect(parcel.status).to eq(new_status)
      end
    end

    context 'with transition from pre_shipped to completed' do
      let(:old_status) { 'pre_shipped' }
      let(:new_status) { 'completed' }

      it 'does not update status' do
        subject

        expect(parcel.status).to eq(old_status)
      end
    end

    context 'with transition from completed to in_transit' do
      let(:old_status) { 'completed' }
      let(:new_status) { 'in_transit' }

      it 'does not update status' do
        subject

        expect(parcel.status).to eq(old_status)
      end
    end

    context 'with transition from completed to pre_shipped' do
      let(:old_status) { 'completed' }
      let(:new_status) { 'pre_shipped' }

      it 'does not update status' do
        subject

        expect(parcel.status).to eq(old_status)
      end
    end

    context 'with transition from in_transit to pre_shipped' do
      let(:old_status) { 'in_transit' }
      let(:new_status) { 'pre_shipped' }

      it 'does not update status' do
        subject

        expect(parcel.status).to eq(old_status)
      end
    end
  end
end
