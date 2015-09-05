class UserBuilder
  def self.adrian_marino
    User.new 'Adrian', 'Marino', 'amarino', 'password'
  end

  def self.tamara_pepe
    User.new 'Tamara', 'Pepe', 'tpepe', 'password'
  end

  private_class_method :new
end