require 'ostruct'

class ActivitiesRepository
  def find_all_with_athlete_id(athlete_id)
    dao.where(athlete_id: athlete_id).map do |activity_model|
      make_entity(activity_model)
    end
  end

  def save(entity)
    entity_id = entity.delete(:id)
    if entity_id
      model = dao.find_by(id: entity_id)
      return StoreResult.new(entity, false, { message: "record not found" }) unless model
    else
      model = dao.new
    end

    model.attributes = entity.to_h
    saved = model.save
    StoreResult.new(make_entity(model), saved, make_errors(model))
  end

  def destroy(id)
    model = dao.find_by(id: id)
    return StoreResult.new(nil, false, [{ message: "record not found" }]) unless model

    model.destroy
    StoreResult.new(make_entity(model), true, [])
  end

  private

  def make_entity(model)
    Entity.new({
      id: model.id,
      athlete_id: model.athlete_id,
      started_at: model.started_at,
      finished_at: model.finished_at,
      distance: model.distance,
      elevation_gain: model.elevation_gain
    })
  end

  def make_errors(model)
    errors = []

    model.errors.each do |field, message|
      if field == :base
        field = nil
      end
      errors << { field: field.to_s, message: message }
    end

    errors
  end

  def dao
    @dao ||= ActivityModel
  end
end