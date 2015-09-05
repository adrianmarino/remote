class StringBuilder
  def initialize(a_value = nil)
    @value=[a_value]
  end
  
  def <<(a_value)
    @value << a_value
  end
  
  def to_s
    @value.join(String.empty)
  end
end