require 'rspec'

RSpec.describe ActivitiesService do

  let(:activities_repository){ instance_double('ActivitiesRepository') }

  before do
    subject.instance_variable_set :@activities_repository, activities_repository
  end

  describe '#find_all_for_athlete' do
    it 'asks the activities repository for all activities for a given athlete' do
      activity_entities = double(:activity_entities)
      expect(activities_repository).to receive(:find_all_with_athlete_id).with(7).and_return(activity_entities)

      expect(subject.find_all_for_athlete(7)).to equal(activity_entities)
    end
  end

  describe '#create' do
    it 'asks the activities repository to save an activity' do
      result = instance_double('StoreResult')
      expect(activities_repository).to receive(:save).and_return(result)

      expect(subject.create({})).to eq result
    end
  end

  describe '#update' do
    it 'sets the id and asks the activities repository to save an activity' do
      result = instance_double('StoreResult')
      expect(activities_repository).to receive(:save).with(-> (entity) { expect(entity.id).to eq 1 }).and_return(result)

      expect(subject.update(1, {})).to eq result
    end
  end

  describe '#update' do
    it 'asks the activities repository to delete the activity' do
      result = instance_double('StoreResult')
      expect(activities_repository).to receive(:destroy).with(1).and_return(result)

      expect(subject.delete(1)).to eq result
    end
  end
end