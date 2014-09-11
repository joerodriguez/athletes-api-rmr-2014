require 'ostruct'

class Entity
  def initialize(attrs={})
    @data = OpenStruct.new(attrs)
  end

  def delete(field_name)
    if @data[field_name]
      @data.delete_field(field_name)
    end
  end

  def as_json(options = nil)
    @data.instance_variable_get("@table").as_json(options)
  end

  def method_missing(meth, *args, &block)
    @data.send(meth, *args, &block)
  end
end