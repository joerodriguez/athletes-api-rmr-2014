class ActivitiesService
  def find_all_for_athlete(athlete_id)
    activities_repository.find_all_with_athlete_id(athlete_id)
  end

  def create(attrs)
    entity_to_create = Entity.new(attrs)
    activities_repository.save(entity_to_create)
  end

  def update(id, attrs)
    entity_to_update = Entity.new(attrs)
    entity_to_update.id = id
    activities_repository.save(entity_to_update)
  end

  def delete(id)
    activities_repository.destroy(id)
  end

  private

  def activities_repository
    @activities_repository ||= ActivitiesRepository.new
  end
end