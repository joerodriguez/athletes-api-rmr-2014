class ErrorFactory
  def self.make(model)
    errors = []

    model.errors.each do |field, message|
      if field == :base
        field = nil
      end
      errors << { field: field.to_s, message: message }
    end

    errors
  end
end