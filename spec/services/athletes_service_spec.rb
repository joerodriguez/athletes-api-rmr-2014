require 'rspec'

RSpec.describe AthletesService do

  let(:athletes_repository){ instance_double('AthletesRepository') }

  before do
    subject.instance_variable_set :@athletes_repository, athletes_repository
  end

  describe '#all' do
    it 'asks the athletes repository for all athletes' do
      athlete_entities = double(:athlete_entities)
      expect(athletes_repository).to receive(:find_all).and_return(athlete_entities)

      expect(subject.all).to equal(athlete_entities)
    end
  end

  describe '#create' do
    it 'asks the athletes repository to save an athlete' do
      result = instance_double('StoreResult')
      expect(athletes_repository).to receive(:save).and_return(result)

      expect(subject.create({})).to eq result
    end
  end

  describe '#update' do
    it 'sets the id and asks the athletes repository to save an athlete' do
      result = instance_double('StoreResult')
      expect(athletes_repository).to receive(:save).with(-> (entity) { expect(entity.id).to eq 1 }).and_return(result)

      expect(subject.update(1, {})).to eq result
    end
  end

  describe '#update' do
    it 'asks the athletes repository to delete the athlete' do
      result = instance_double('StoreResult')
      expect(athletes_repository).to receive(:destroy).with(1).and_return(result)

      expect(subject.delete(1)).to eq result
    end
  end
end