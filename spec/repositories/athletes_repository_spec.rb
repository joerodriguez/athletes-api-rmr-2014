require 'rspec'

RSpec.describe AthletesRepository do

  let(:athletes_repository) { instance_double("AthletesRepository") }

  describe '#all' do
    it 'queries the AthleteModel and returns all athletes as entities' do
      AthleteModel.create!({
        name: "Brendan Benson",
        weight: 160,
        avatar: "http"
      })

      athlete_entities = subject.find_all

      expect(athlete_entities.size).to eq 1
      expect(athlete_entities.first.name).to eq "Brendan Benson"
      expect(athlete_entities.first.weight).to eq 160
      expect(athlete_entities.first.avatar).to eq "http"
    end
  end

  describe '#save' do
    before do
      entity = Entity.new({
        name: 'Joseph',
        weight: 175,
        avatar: 'what'
      })

      @existing_entity = subject.save(entity).entity
    end

    context 'with a new record' do
      it 'returns a successful store result with valid data' do
        result = subject.save(Entity.new({ name: 'Joseph' }))

        expect(result.success?).to eq true
        expect(result.entity.name).to eq 'Joseph'
        expect(result.entity.id).to be_present
      end

      it 'returns an unsuccessful store result with invalid data' do
        result = subject.save(Entity.new({ name: '' }))

        expect(result.success?).to eq false
        expect(result.errors[0][:field]).to eq 'name'
        expect(result.errors[0][:message]).to eq 'is too short (minimum is 3 characters)'
      end
    end

    context 'with an existing record' do
      it 'returns a successful store result with valid data' do
        result = subject.save(Entity.new({ id: @existing_entity.id, name: 'Joseph Rodriguez' }))

        expect(result.success?).to eq true
      end

      it 'returns an unsuccessful store result with invalid data' do
        result = subject.save(Entity.new({ id: @existing_entity.id, name: '' }))

        expect(result.success?).to eq false
        expect(result.errors[0][:field]).to eq 'name'
        expect(result.errors[0][:message]).to eq 'is too short (minimum is 3 characters)'
      end

      context 'when the record to be saved does not exist' do
        it 'returns a record not found error' do
          result = subject.save(Entity.new({id: 42}))
          expect(result.success?).to eq false
        end
      end
    end
  end

  describe '#destroy' do
    before do
      entity = Entity.new({
        name: 'Joseph',
        weight: 175,
        avatar: 'what'
      })

      @existing_entity = subject.save(entity).entity
    end

    it 'returns a successful store result and destroys the record' do
      result = subject.destroy(@existing_entity.id)

      expect(result.success?).to eq true
    end

    context 'when the record to be saved does not exist' do
      it 'returns a record not found error' do
        result = subject.destroy(42)

        expect(result.success?).to eq false
        expect(result.errors[0][:message]).to eq "record not found"
      end
    end
  end
end