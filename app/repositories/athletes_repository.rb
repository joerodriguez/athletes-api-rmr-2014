require 'ostruct'

class AthletesRepository
  def find_all
    dao.all.map do |athlete_model|
      make_entity(athlete_model)
    end
  end

  def find_one(id)
    model = dao.find_by(id: id)
    make_entity(model) if model
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
    StoreResult.new(make_entity(model), saved, ErrorFactory.make(model))
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
      name: model.name,
      weight: model.weight,
      avatar: model.avatar
    })
  end

  def dao
    @dao ||= AthleteModel
  end
end