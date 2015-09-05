require 'rinda/ring'
require 'remote/service_provider'

class ServiceRunner
  def self.run(aService)
    DRb.start_service
    ServiceProvider.register aService
    DRb.thread.join
  end
    
  private_class_method :new
end

