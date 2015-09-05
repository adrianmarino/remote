require 'rinda/ring'

class RingServer
  def run
    DRb.start_service
    Rinda::RingServer.new @tupleSpace
    DRb.thread.join
  end
  
  def initialize(aTupleSpace)
    @tupleSpace = aTupleSpace
  end
end