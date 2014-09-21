require 'singleton'

class Aggregate
  def self.schemas
    @@schemas
  end

  def self.schema(name, &block)
    @@schemas ||= {}
    @@schemas[name] = Schema.new(name, block)
  end

  def self.clear
    @@schemas = {}
  end
end

require 'aggregate/schema'
require 'aggregate/resource'