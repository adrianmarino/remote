require 'rinda/ring'

class ServiceProvider
  public
  def self.register(aService)
    self.ring_server.write(aService.tuple, Rinda::SimpleRenewer.new)
  end  

  private
  def self.ring_server
    Rinda::RingFinger.primary
  end

  private_class_method :new
end
