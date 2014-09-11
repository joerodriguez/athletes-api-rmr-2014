class AthletesService
  def all
    athletes_repository.find_all
  end


  def create(attrs)
    entity_to_create = Entity.new(attrs)
    athletes_repository.save(entity_to_create)
  end

  private

  def athletes_repository
    @athletes_repository ||= AthletesRepository.new
  end
end