require './current_temp'
require './address_to_coordinates'
RSpec.describe Temperature do
  let(:lat) { 35 }
  let(:long) { 139 }
  subject(:current_temp) do
    described_class.new.fetch_current_temp(lat, long)
  end

  context 'when correct lat and long is given' do
    let(:coordinates) { "#{lat}, #{long}" }
    let(:uri) { URI("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{long}&APPID=4344aa8adf06a5646109007806023afe") }
    let(:response) do
      {
        "coord" => {
          "lon":139,"lat":35
        },
        "sys": {"country":"JP","sunrise":1369769524,"sunset":1369821049},
        "weather": [{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],
        "main" => {
          "temp" => 289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},
        "wind": {"speed":7.31,"deg":187.002},
        "rain": {"3h":0},
        "clouds": {"all":92},
        "dt": 1369824698,
        "id": 1851632,
        "name": "Shuzenji",
        "cod": 200
      }
    end
    let(:celsius_temp) { 143 }

    before do
      allow(Coordinates).to receive(:address_to_coordinates).and_return(coordinates)
      allow(Net::HTTP).to receive(:get).with(uri).and_return(response)
    end

    it 'returns the current temperature' do
      expect(subject).to eq(celsius_temp)
    end
  end
end
