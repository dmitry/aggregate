class Aggregate::Resource
  def initialize(name, block)
    @name = name

    instance_exec(&block)
  end
end