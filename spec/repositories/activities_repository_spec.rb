require 'rspec'

RSpec.describe ActivitiesRepository do

  let(:activities_repository) { instance_double("ActivitiesRepository") }

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

  describe '#find_all_with_athlete_id' do
    it 'queries the ActivityModel and returns athlete\'s activities as entities' do
      activity_entities = subject.find_all_with_athlete_id(athlete.id)

      expect(activity_entities.first.athlete_id).to eq athlete.id
      expect(activity_entities.first.started_at).to eq DateTime.parse('2001-02-03T04:05:06+07:00')
      expect(activity_entities.first.finished_at).to eq DateTime.parse('2001-02-03T04:05:06+07:00')
      expect(activity_entities.first.elevation_gain).to eq 2320
      expect(activity_entities.first.distance).to eq 56
    end
  end

  describe '#save' do
    context 'with a new record' do
      it 'returns a successful store result with valid data' do
        result = subject.save(Entity.new({ athlete_id: athlete.id }))

        expect(result.success?).to eq true
        expect(result.entity.athlete_id).to eq athlete.id
        expect(result.entity.id).to be_present
      end

      it 'returns an unsuccessful store result with invalid data' do
        result = subject.save(Entity.new({ athlete_id: nil }))

        expect(result.success?).to eq false
        expect(result.errors[0][:field]).to eq 'athlete'
        expect(result.errors[0][:message]).to eq 'can\'t be blank'
      end
    end

    context 'with an existing record' do
      it 'returns a successful store result with valid data' do
        result = subject.save(Entity.new({ id: activity.id, elevation_gain: 1 }))

        expect(result.success?).to eq true
      end

      it 'returns an unsuccessful store result with invalid data' do
        result = subject.save(Entity.new({ id: activity.id, athlete_id: '' }))

        expect(result.success?).to eq false
        expect(result.errors[0][:field]).to eq 'athlete'
        expect(result.errors[0][:message]).to eq 'can\'t be blank'
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
    it 'returns a successful store result and destroys the record' do
      result = subject.destroy(activity.id)

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