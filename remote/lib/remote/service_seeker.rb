require 'rinda/ring'

class ServiceSeeker
  def seek_by_name(aServiceName)
    service = @ring_server.read([aServiceName, nil,nil,nil])
    puts "#{service[3]} found..."
    service[2]
  end

  def initialize
    @ring_server = Rinda::RingFinger.primary
  end
end