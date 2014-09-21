require 'spec_helper'

describe Aggregate::Schema do
  describe '#resource' do
    it 'adds' do
      Aggregate.schema(:forum) {}
      schema = Aggregate.schema(:forum)
      schema.resource(:resource_1) {}
      expect(schema.resources.size).to eq 1
    end
  end
end