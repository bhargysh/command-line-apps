require './current_temp'
RSpec.describe do
  subject(:fetch_current_temp) do
    described_class.fetch_current_temp
  end

  context 'when correct lat and long is given' do
    let(:lat) { 25 }
    let(:long) { 55 }
    let(:response) { '25 degrees' }

    it 'returns the correct current temperature' do
      expect(subject).to eq(response)
    end
  end
end
