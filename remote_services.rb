require 'remote'

class RemoteServices
  def self.user_service
    ServiceSeeker.new.seek_by_name :userService
  end
end
