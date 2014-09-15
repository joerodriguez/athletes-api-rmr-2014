require 'rails_helper'

RSpec.describe ActivitiesController, :type => :controller do

  let(:activities_service) { instance_double('ActivitiesService') }

  before do
    subject.instance_variable_set :@activities_service, activities_service
  end

  describe "GET index" do
    it 'asks the activities service for a given athlete\s activities' do
      activities = [instance_double('ActivitiyEntity')]
      expect(activities_service).to receive(:find_all_for_athlete).with('7').and_return(activities)

      get :index, format: :json, athlete_id: '7'

      expect(assigns(:activities)).to eq(activities)
    end
  end

  describe "POST create" do
    context 'with a successful store result' do
      it 'results in success' do
        persistence_transaction = instance_double("StoreResult", success?: true, entity: {})
        activity_attributes = { athlete_id: '34' }
        expect(activities_service).to receive(:create).with(activity_attributes).and_return(persistence_transaction)

        post :create, activity: activity_attributes

        expect(response.status).to eq 201
      end
    end

    context 'with an unsuccessful store result' do
      it 'results in unprocessable entity' do
        persistence_transaction = instance_double("StoreResult", success?: false, errors: [])
        activity_attributes = { athlete_id: nil }
        expect(activities_service).to receive(:create).with(activity_attributes).and_return(persistence_transaction)

        post :create, activity: activity_attributes

        expect(response.status).to eq 422
      end
    end
  end

  describe 'PUT update' do
    context 'with a successful store result' do
      it 'results in success' do
        persistence_transaction = instance_double("StoreResult", success?: true, entity: {})
        activity_attributes = { distance: '12' }
        expect(activities_service).to receive(:update).with('4', activity_attributes).and_return(persistence_transaction)

        put :update, id: 4, activity: activity_attributes

        expect(response.status).to eq 202
      end
    end

    context 'with an unsuccessful store result' do
      it 'results in unprocessable entity' do
        persistence_transaction = instance_double("StoreResult", success?: false, errors: [])
        activity_attributes = { distance: '-12' }
        expect(activities_service).to receive(:update).with('4', activity_attributes).and_return(persistence_transaction)

        put :update, id: 4, activity: activity_attributes

        expect(response.status).to eq 422
      end
    end
  end

  describe 'DELETE destroy' do
    context 'with a successful store result' do
      it 'results in success' do
        persistence_transaction = instance_double("StoreResult", success?: true)
        expect(activities_service).to receive(:delete).with('4').and_return(persistence_transaction)

        delete :destroy, id: 4

        expect(response.status).to eq 200
      end
    end

    context 'with an unsuccessful store result' do
      it 'results in unprocessable entity' do
        persistence_transaction = instance_double("StoreResult", success?: false, errors: [{message: "not found"}])
        expect(activities_service).to receive(:delete).with('4').and_return(persistence_transaction)

        delete :destroy, id: 4

        expect(response.status).to eq 400
      end
    end
  end
end
