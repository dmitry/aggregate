class Aggregate::Resource
  def initialize(name, block)
    @name = name
    @block = block
  end
end