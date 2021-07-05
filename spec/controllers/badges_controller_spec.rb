require 'rails_helper'

RSpec.describe BadgesController, type: :controller do
  describe '#submit' do
    let(:double_badge_submission) { double('BadgeSubmission') }
    let(:double_badge) { double('Badge', hash: hash, uuid: uuid) }

    before do
      allow(BadgeSubmission).to receive(:new).and_return double_badge_submission
      allow(Badge).to receive(:new).and_return double_badge
      allow(double_badge_submission).to receive(:proof_id_from).and_return(proof_id)
      allow_any_instance_of(described_class).to receive(:compress).and_return 'compressed_info'
      allow_any_instance_of(described_class).to receive(:transform_to_hash).and_return hash
    end

    context 'when badge is successfully submitted' do
      let(:hash) { 'badge_hash' }
      let(:proof_id) { 'proof_id' }
      let(:uuid) { 'uuid' }

      after { get :success, params: {uuid: uuid, name: 'name', date: 'date'} }

      it 'returns proof id' do
        expect(double_badge_submission).to receive(:proof_id_from).with(hash).and_return(proof_id)
      end

      it 'inits badge' do
        expect(Badge).to receive(:new).with(hash, uuid)
      end
    end
  end
end