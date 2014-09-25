class Aggregate::Schema
  attr_reader :resources

  def initialize(name, block)
    @name = name
    @resources = {}

    instance_exec(&block)
  end

  def self.reset
    constants.each do |constant|
      remove_const(constant)
    end
  end

  def document(name, &block)
    class_name = document_class_name(name)
    klass = self.class.const_set(class_name, Class.new)
    klass.include(Mongoid::Document)
    klass.class_eval(&block)
  end

  def document_class(name)
    self.class.const_get(document_class_name(name))
  end

  def document_class_name(name)
    "#{@name.to_s.classify}#{name.to_s.classify}"
  end

  def resource(name, &block)
    if block_given?
      resources[name] = Aggregate::Resource.new(name, block)
    else
      resources[name]
    end
  end
end