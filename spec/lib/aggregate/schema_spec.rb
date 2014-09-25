require 'spec_helper'

describe Aggregate::Schema do
  describe '#reset' do
    before do
      @schema = Aggregate::Schema.new(:forum, -> { document(:category) {} })
    end

    it 'removes nested model class' do
      expect(Aggregate::Schema.constants).to eq [:ForumCategory]
      Aggregate::Schema.reset
      expect(Aggregate::Schema.constants).to eq []
    end
  end

  describe '#resource' do
    before do
      @schema = Aggregate::Schema.new(:forum, -> {})
      @schema.resource(:resource_1) {}
    end

    it 'adds one resource' do
      expect(@schema.resources.size).to eq 1
    end

    it 'returns resource' do
      resource = @schema.resources[:resource_1]
      expect(@schema.resource(:resource_1)).to eq resource
    end
  end

  describe '#document' do
    before do
      @schema = Aggregate::Schema.new(
        :forum,
        -> {
          document :category do
            field :name
          end
        }
      )
    end

    it 'defined as class' do
      expect(@schema.document_class(:category)).to eq Aggregate::Schema::ForumCategory
    end

    it 'class defined with field name' do
      expect(@schema.document_class(:category).fields.keys).to include('name')
    end
  end
end