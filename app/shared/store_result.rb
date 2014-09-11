class StoreResult
  attr_reader :entity, :errors

  def initialize(entity, saved, errors)
    @entity = entity
    @errors = errors
    @success = saved
  end

  def success?
    @success
  end
end