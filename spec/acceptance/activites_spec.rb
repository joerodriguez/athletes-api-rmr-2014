require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Activity' do

  header "Content-Type", "application/json"
  let(:raw_post){ params.to_json }

  let(:athlete) do
    AthleteModel.create!({
      name: 'Vincenzo NIBALI',
      weight: 65,
      avatar: 'http://www.letour.fr/PHOTOS/TDF/2014/RIDERS/41.jpg'
    })
  end

  let!(:activity) do
    ActivityModel.create!({
      athlete: athlete,
      started_at: DateTime.parse('2001-02-03T04:05:06+07:00'),
      finished_at: DateTime.parse('2001-02-03T04:05:06+07:00'),
      elevation_gain: 2320,
      distance: 56
    })
  end

  get '/activities.json' do
    example 'List for specific athlete' do
      do_request athlete_id: athlete.id

      expect(status).to eq 200

      expect(response_json.size).to eq 1
      expect(response_json[0]['athlete_id']).to eq athlete.id
      expect(response_json[0]['started_at']).to eq '2001-02-02T21:05:06.000Z'
      expect(response_json[0]['finished_at']).to eq '2001-02-02T21:05:06.000Z'
      expect(response_json[0]['elevation_gain']).to eq 2320
      expect(response_json[0]['distance']).to eq 56
    end
  end

  post '/activities.json' do
    example 'Create with valid data' do
      do_request activity: {
        athlete_id: athlete.id,
        started_at: '2001-02-03T04:05:06+07:00',
        finished_at: '2001-02-03T04:07:06+07:00',
        elevation_gain: 232,
        distance: 5
      }

      expect(status).to eq 201

      expect(response_json['athlete_id']).to eq athlete.id
      expect(response_json['started_at']).to eq '2001-02-02T21:05:06.000Z'
      expect(response_json['finished_at']).to eq '2001-02-02T21:07:06.000Z'
      expect(response_json['elevation_gain']).to eq 232
      expect(response_json['distance']).to eq 5
    end

    example 'Create with invalid data' do
      do_request activity: { elevation_gain: 232 }

      expect(status).to eq 422

      expect(response_json).to eq({ 'errors' => [{ 'field' => 'athlete', 'message' => "can't be blank" }]})
    end
  end

  put "/activities/:id.json" do
    let(:id) { activity.id }

    example 'Update with invalid data' do
      do_request activity: { athlete_id: nil }

      expect(status).to eq 422

      expect(response_json).to eq({ 'errors' => [{ 'field' => 'athlete', 'message' => "can't be blank" }]})
    end

    example 'Update with valid data' do
      do_request activity: { elevation_gain: 354 }

      expect(status).to eq 202

      expect(response_json['elevation_gain']).to eq 354
    end
  end

  delete "/activities/:id.json" do
    let(:id) { activity.id }

    example 'Deleting an existing activity' do
      do_request

      expect(status).to eq 200
    end

  end
end

def response_json
  JSON.parse response_body
end