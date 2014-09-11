require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Athlete' do
  get '/athletes.json' do
    example 'List' do
      AthleteModel.create!({
        name: 'Vincenzo NIBALI',
        weight: 65,
        avatar: 'http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/41.jpg'
      })

      do_request

      expect(status).to eq 200

      expect(response_json.size).to eq 1
      expect(response_json[0]['name']).to eq 'Vincenzo NIBALI'
      expect(response_json[0]['weight']).to eq 65
      expect(response_json[0]['avatar']).to eq 'http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/41.jpg'
    end
  end

  post '/athletes.json' do
    example 'Create with valid data' do
      do_request athlete: { weight: 63, name: 'Peter SAGAN', avatar: 'http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/51.jpg' }

      expect(status).to eq 201

      expect(response_json['name']).to eq 'Peter SAGAN'
      expect(response_json['weight']).to eq 63
      expect(response_json['avatar']).to eq 'http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/51.jpg'
    end

    example 'Create with invalid data' do
      do_request athlete: { weight: 155, name: 'a' }

      expect(status).to eq 422

      expect(response_json).to eq({ 'errors' => [{ 'field' => 'name', 'message' => 'is too short (minimum is 3 characters)' }]})
    end
  end

  put "/athletes/:id.json" do
    let(:existing_athlete) do
      AthleteModel.create!({
        name: 'Rafal MAJKA',
        weight: 59,
        avatar: 'http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/34.jpg'
      })
    end

    let(:id) { existing_athlete.id }

    example 'Update with invalid data' do
      do_request athlete: { name: 'b' }

      expect(status).to eq 422

      expect(response_json).to eq({ 'errors' => [{ 'field' => 'name', 'message' => 'is too short (minimum is 3 characters)' }]})
    end

    example 'Update with valid data' do
      do_request athlete: { name: 'Raphael MAJKA' }

      expect(status).to eq 202

      expect(response_json['name']).to eq 'Raphael MAJKA'
    end
  end
end

def response_json
  JSON.parse response_body
end