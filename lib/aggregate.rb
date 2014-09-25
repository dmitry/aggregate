require 'mongoid'

module Aggregate
  extend self

  attr_reader :schemas
  @schemas = {}

  def schema(name, &block)
    if block_given?
      schemas[name] = Schema.new(name, block)
    else
      schemas[name]
    end
  end

  def reset
    Aggregate::Schema.reset
    schemas.each do |name, schema|
      schemas.delete(name)
    end
  end
end

require 'aggregate/schema'
require 'aggregate/resource'
require 'aggregate/document'