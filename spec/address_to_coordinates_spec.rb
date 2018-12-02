require './app/address_to_coordinates'
require './app/geocoder'

RSpec.describe Coordinates do
  subject(:address_to_coordinates) do
    described_class.address_to_coordinates(address)
  end

  context 'when address is provided in correct format' do
    let(:address) { '39 Rainbow Rd, Transylvania, LIT'}
    let(:response) { '99.0123, -100.4567'}

    before do
      allow(Geocoder).to receive(:bing_api_key)
      allow(Geocoder).to receive(:coordinates).with(address).and_return(response)
    end

    it 'returns the latitude and longitude' do
      expect(subject).to eq(response)
    end

    it 'correctly extracts the latitude' do
      expect(Coordinates.lat(response)).to eq(99.0123)
    end

    it 'correctly extracts the longitude' do
      expect(Coordinates.long(response)).to eq(-100.4567)
    end
  end

  context 'when address is invalid' do
    let(:address) { 12345678 }
    let(:error_msg) { 'Invalid input, please enter a valid string' }

    it 'returns an error' do
      expect{ subject }.to raise_error(TypeError)
    end

    it 'returns the correct error message' do
      expect{ subject }.to raise_error(TypeError, error_msg)
    end
  end
end
