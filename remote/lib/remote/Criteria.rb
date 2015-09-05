class Criteria
  def self.idEqlTo(an_id)
   return Proc.new do |an_object| an_object.identifier.eql? an_id end
  end

  private_class_method :new
end