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
    it 'asks the athletes repository for all athletes' do
      result = instance_double('StoreResult')
      expect(athletes_repository).to receive(:save).and_return(result)

      expect(subject.create({})).to eq result
    end
  end
end