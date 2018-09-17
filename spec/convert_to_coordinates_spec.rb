require './address_to_coordinates'
require 'byebug'

RSpec.describe AddressToCoordinates do
  subject(:address_to_coordinates) do
    described_class.address_to_coordinates(address)
  end
  let(:address) { '39 Rainbow Rd, Transylvania, LIT'}
  let(:coordinates) { '99.0123, -100.4567'}

  context 'when address is provided in full format' do
    # before do
    #   allow(AddressToCoordinates).to receive(:address_to_coordinates)
    # end
    # it 'passes in the address correctly' do
    #   expect(subject).to receive(address)
    # end
    it 'returns the latitude and longitude coordinates' do
      expect(subject).to eq(coordinates)
    end
  end
end
