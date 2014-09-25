class Aggregate::Resource
  def initialize(name, block)
    @name = name

    instance_exec(&block)
  end

  def all(every)
    # TODO implement
  end
end