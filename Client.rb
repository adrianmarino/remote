require 'remote'
require './remote_services'
require './user_builder'
require './user'

DRb.start_service

puts "Get remote service..."
user_service = RemoteServices.user_service

puts "Add two users..."
user_service.add UserBuilder.adrian_marino
user_service.add UserBuilder.tamara_pepe
puts "Show all users on remote store..."
user_service.all.each {|an_user| puts an_user}

puts "Find user with 1 identifier..."
user = user_service.find Criteria.idEqlTo(1)
puts user

DRb.stop_service