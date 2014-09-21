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

  describe "GET show" do
    it 'asks the athlete service for the athlete' do
      athlete = instance_double('AthleteEntity')
      expect(athletes_service).to receive(:one).with('4').and_return(athlete)

      get :show, id: 4, format: :json

      expect(assigns(:athlete)).to eq(athlete)
    end

    it 'returns a 404 if the athlete is not found' do
      expect(athletes_service).to receive(:one).with('4').and_return(nil)

      get :show, id: 4, format: :json

      expect(assigns(:athlete)).to eq(nil)
      expect(response.status).to eq 404
    end
  end

  describe "POST create" do
    context 'with a successful store result' do
      it 'results in success' do
        persistence_transaction = instance_double("StoreResult", success?: true, entity: {})
        athlete_attributes = { name: "Jose Rodrigo" }
        expect(athletes_service).to receive(:create).with(athlete_attributes).and_return(persistence_transaction)

        post :create, athlete: athlete_attributes

        expect(response.status).to eq 201
      end
    end

    context 'with an unsuccessful store result' do
      it 'results in unprocessable entity' do
        persistence_transaction = instance_double("StoreResult", success?: false, errors: [])
        athlete_attributes = { name: "J" }
        expect(athletes_service).to receive(:create).with(athlete_attributes).and_return(persistence_transaction)

        post :create, athlete: athlete_attributes

        expect(response.status).to eq 422
      end
    end
  end

  describe 'PUT update' do
    context 'with a successful store result' do
      it 'results in success' do
        persistence_transaction = instance_double("StoreResult", success?: true, entity: {})
        athlete_attributes = { name: "Jose Rodrigo" }
        expect(athletes_service).to receive(:update).with('4', athlete_attributes).and_return(persistence_transaction)

        put :update, id: 4, athlete: athlete_attributes

        expect(response.status).to eq 202
      end
    end

    context 'with an unsuccessful store result' do
      it 'results in unprocessable entity' do
        persistence_transaction = instance_double("StoreResult", success?: false, errors: [])
        athlete_attributes = { name: "J" }
        expect(athletes_service).to receive(:update).with('4', athlete_attributes).and_return(persistence_transaction)

        put :update, id: 4, athlete: athlete_attributes

        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE destroy' do
    context 'with a successful store result' do
      it 'results in success' do
        persistence_transaction = instance_double("StoreResult", success?: true)
        expect(athletes_service).to receive(:delete).with('4').and_return(persistence_transaction)

        delete :destroy, id: 4

        expect(response.status).to eq 200
      end
    end

    context 'with an unsuccessful store result' do
      it 'results in unprocessable entity' do
        persistence_transaction = instance_double("StoreResult", success?: false, errors: [{message: "not found"}])
        expect(athletes_service).to receive(:delete).with('4').and_return(persistence_transaction)

        delete :destroy, id: 4

        expect(response.status).to eq 400
      end
    end
  end
end
