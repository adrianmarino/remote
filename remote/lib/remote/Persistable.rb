require 'remote/entity_string_representation'

module Persistable
  attr_accessor :identifier

  def to_s
    EntityStringRepresentation.new(self).with_class_name.with_identifier.with_variables.to_s
  end

  def eql?(an_object)
    isSuperclassOf(an_object) && equalIdentifier(an_object)
  end

  def class_name
    self.class.name
  end

  private
  def equalIdentifier(an_object)
    identifier == an_object.identifier
  end
  
  def isSuperclassOf(an_object)
    an_object.class > self.class
  end
end