require 'remote/string'
require 'remote/string_builder'

class EntityStringRepresentation
  def initialize(an_entity)
    @entity = an_entity
    @value = StringBuilder.new
  end

  def to_s
    @value.to_s
  end

  def with_class_name
    @value << @entity.class_name << String.white_space << entity << String.new_line << tab
    self
  end

  def with_variables
    data_variable_names.each {|a_variable_name| append_variable_line a_variable_name }
    self
  end

  def with_identifier
    @value<< identifier_name.capitalize_first_character << 
        String.white_space << String.equal << String.white_space << String.quote << @entity.identifier << String.quote << String.new_line << tab  
    self
  end

  private
  def append_variable_line(a_variable_name)
    @value << format_variable_name(a_variable_name) << String.white_space << String.equal << String.white_space << String.quote << value_of(a_variable_name) << String.quote << String.new_line << tab
  end

  def format_variable_name(a_variable_name)
    a_variable_name.to_s.remove_first.capitalize_first_character
  end
  
  def value_of(a_variable_name)
    @entity.instance_variable_get a_variable_name
  end
  
  def data_variable_names
    return @entity.instance_variables.reject {|a_variable_name| a_variable_name.to_s == identifier_name.to_instance_variable_name }
  end
  
  def entity
    'entity'
  end

  def identifier_name
    'identifier'
  end

  def tab
    String.white_space + String.white_space
  end
end