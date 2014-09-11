require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Athlete' do
  get '/athletes.json' do
    example 'Listing all athletes' do
      AthleteModel.create!({
        name: 'Brendan Benson',
        weight: 160,
        avatar: 'http://blogs.tennessean.com/tunein/files/2010/11/Brendan-Benson.gif'
      })

      do_request

      expect(status).to eq 200

      expect(response_json.size).to eq 1
      expect(response_json[0]['name']).to eq 'Brendan Benson'
      expect(response_json[0]['weight']).to eq 160
      expect(response_json[0]['avatar']).to eq 'http://blogs.tennessean.com/tunein/files/2010/11/Brendan-Benson.gif'
    end
  end

  post '/athletes.json' do
    example 'with complete data' do
      do_request athlete: { weight: 155, name: 'John Jackson', avatar: 'http://what.jpg' }

      expect(status).to eq 201

      expect(response_json['name']).to eq 'John Jackson'
      expect(response_json['weight']).to eq 155
      expect(response_json['avatar']).to eq 'http://what.jpg'
    end

    example 'with incomplete data' do
      do_request athlete: { weight: 155, name: 'a' }

      expect(status).to eq 400

      expect(response_json).to eq({ 'errors' => [{ 'field' => 'name', 'message' => 'is too short (minimum is 3 characters)' }]})
    end
  end
end

def response_json
  JSON.parse response_body
end