require 'rails_helper'

RSpec.describe AthletesController, :type => :controller do

  let(:athletes_service) { instance_double('AthletesService') }

  before do
    subject.instance_variable_set :@athletes_service, athletes_service
  end

  describe "GET index" do
    it 'asks the athlete service for all athletes' do
      athletes = [instance_double('AthleteEntity')]
      expect(athletes_service).to receive(:all).and_return(athletes)

      get :index, format: :json

      expect(assigns(:athletes)).to eq(athletes)
    end
  end

  describe "POST create" do
    it 'asks the athlete service to create a new athlete' do
      persistence_transaction = instance_double("StoreResult", success?: true, entity: {})
      athlete_attributes = { name: "Jose Rodrigo" }
      expect(athletes_service).to receive(:create).with(athlete_attributes).and_return(persistence_transaction)

      post :create, athlete: athlete_attributes
    end
  end
end
