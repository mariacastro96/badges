require 'rails_helper'

RSpec.describe BadgeSubmission do
  subject(:submit) { described_class.new }

  describe '#proof_id_from' do
    before { stub_const("BadgeSubmission::NODE", 'fake') }

    context 'successful request' do
      let(:proof_id) { 'proof_id' }
      let(:response) do
        {
          'hashes': [
            {
              'proof_id': proof_id
            }
          ]
        }
      end

      before { allow(submit).to receive(:request).and_return response.to_json }

      it 'returns proof id' do
        expect(submit.proof_id_from('hash')).to eq proof_id
      end
    end

    context 'unsuccessful request' do
      before { allow(submit).to receive(:request).and_raise(StandardError) }

      it 'returns proof id' do
        expect{ submit.proof_id_from('hash')}.to raise_error(ChainpointError)
      end
    end
  end
end