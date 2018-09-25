require './address_to_coordinates'
require './geocoder'
require 'byebug'

RSpec.describe AddressToCoordinates do
  subject(:address_to_coordinates) do
    described_class.address_to_coordinates(address)
  end


  context 'when address is provided in correct format' do
    let(:address) { '39 Rainbow Rd, Transylvania, LIT'}
    let(:response) { '99.0123, -100.4567'}

    before do
      allow(Geocoder).to receive(:bing_api_key)
      allow(Geocoder).to receive(:coordinates).and_return(response)
    end

    it 'returns the latitude and longitude' do
      expect(subject).to eq(response)
    end
  end

  context 'when address is invalid' do
    let(:address) { 12345678 }
    let(:error_response) {}

    it 'returns an error message' do
      expect(subject).to raise_error do |error|
        expect(error).to be_a TypeError
        expect(error.message).to eq(error_message)
      end
    end
  end
end
