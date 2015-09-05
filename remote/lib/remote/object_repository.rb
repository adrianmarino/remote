require 'drb'
require 'remote/string'

class ObjectRepository
  include DRbUndumped

  def all
    @objects
  end

  def find(a_criterion)
    @objects.select do |an_object| a_criterion.call an_object end
  end

  def save(an_object)
    if @objects.include? an_object
      @objects.delete an_object
    else
      assign_id_to an_object
    end
    @objects.push an_object
  end

  def remove(an_object)
    @objects.delete an_object
  end

  def tuple
    [ @name, :ObjectRepository, self, @description ]
  end

  def initialize(a_name, a_description = nil)
    @objects = []
    @name = a_name
    @description = a_description.nil? ? a_name.to_s.capitalize_first_character : a_description
    @id_counter=0
  end

  private
  def assign_id_to(an_object)
    if !@objects.include? an_object
      @id_counter+=1
      an_object.identifier = @id_counter
    end
    an_object
  end
end
