require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  include Devise::TestHelpers

  describe 'GET index' do
    let(:city_name) { 'Paris' }

    context 'when city_name is present' do
      it 'searches for attractions when only attractions are selected' do
        expect(SearchLogic).to receive(:get_places_from_city_string).with(city_name, 'attractions').and_return(['Eiffel Tower'])
        get :index, params: { city_name: city_name, place_type_attractions: 'attractions' }
        expect(assigns(:places)).to eq(['Eiffel Tower'])
      end

      it 'searches for multiple types when multiple checkboxes are selected' do
        expect(SearchLogic).to receive(:get_places_from_city_string).with(city_name, 'attractions').and_return(['Jardin des Plantes'])
        expect(SearchLogic).to receive(:get_places_from_city_string).with(city_name, 'hotels').and_return(['Hilton Paris Opera'])
        expect(SearchLogic).to receive(:get_places_from_city_string).with(city_name, 'restaurants').and_return(['La Recyclerie'])
        get :index, params: {
          city_name: city_name,
          place_type_attractions: 'attractions',
          place_type_hotels: 'hotels',
          place_type_restaurants: 'restaurants'
        }
        expect(assigns(:places)).to match_array(['Jardin des Plantes', 'Hilton Paris Opera', 'La Recyclerie'])
      end
    end

    context 'when city_name is not presented' do
      it 'does not perform a search' do
        get :index
        expect(assigns(:places)).to be_nil
      end
    end
  end

end
