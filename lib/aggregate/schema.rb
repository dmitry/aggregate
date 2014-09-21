class Aggregate::Schema
  attr_reader :resources

  def initialize(name, block)
    @name = name
    @block = block
    @resources = {}
  end

  def resource(name, &block)
    @resources[name] = Aggregate::Resource.new(name, block)
  end
end