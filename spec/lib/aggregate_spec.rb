require 'spec_helper'

describe Aggregate do
  describe '#clear' do
    it 'removes schemas' do
      expect(Aggregate.schemas.size).to eq 0
      Aggregate.schema(:post) { }
      expect(Aggregate.schemas.size).to eq 1
      Aggregate.clear
      expect(Aggregate.schemas.size).to eq 0
    end
  end

  describe '#schemas' do
    it 'empty by default' do
      expect(Aggregate.schemas).to be_empty
    end
  end

  describe '#schema' do
    before do
      Aggregate.schema :forum do
      end
    end

    it 'key' do
      expect(Aggregate.schemas).to have_key(:forum)
    end

    it 'items' do
      expect(Aggregate.schemas.size).to eq 1
    end

    it 'be a class' do
      expect(Aggregate.schema(:forum)).to be_kind_of(Aggregate::Schema)
    end
  end
end