require 'remote'

class User
  include Persistable

  attr_accessor :firstname, :lastname, :username, :password

  def initialize(a_firstname,a_lastname,a_username,a_password)
    @firstname  = a_firstname
    @lastname   = a_lastname
    @username   = a_username
    @password   = a_password
  end
end