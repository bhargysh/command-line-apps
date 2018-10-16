require './current_temp'
require './address_to_coordinates'
RSpec.describe Temperature do
  let(:lat) { 25 }
  let(:long) { 55 }
  subject(:current_temp) do
    described_class.new.fetch_current_temp(lat, long)
  end

  context 'when correct lat and long is given' do
    let(:coordinates) { '25, 55' }
    let(:response) { '25 deg' }

    before do
      allow(Coordinates).to receive(:address_to_coordinates).and_return(coordinates)
      #instance_double(Temperature)
      allow(Temperature).to receive(:fetch_response).and_return(response)
    end

    it 'returns the current temperature' do
      expect(subject).to eq(response)
    end
  end
end
