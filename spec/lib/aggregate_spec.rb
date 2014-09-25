require 'spec_helper'

describe Aggregate do
  describe 'reset' do
    it 'resets schema definitions' do
      expect(Aggregate.schemas.size).to eq 0
      Aggregate.schema(:blog) { }
      expect(Aggregate.schemas.size).to eq 1
      Aggregate.reset
      expect(Aggregate.schemas.size).to eq 0
    end

    it 'resets schema models' do
      Aggregate.schema(:blog) do
        document :post do
        end
      end

      expect(Aggregate::Schema.constants).to eq [:BlogPost]

      Aggregate.reset

      expect(Aggregate::Schema.constants).to eq []
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

    context 'defines' do
      it 'key' do
        expect(Aggregate.schemas).to have_key(:forum)
      end

      it 'items' do
        expect(Aggregate.schemas.size).to eq 1
      end
    end

    context 'fetches' do
      it 'have the same block' do
        schema = Aggregate.schemas[:forum]
        expect(Aggregate.schema(:forum)).to eq schema
      end

      it 'is Schema class' do
        expect(Aggregate.schema(:forum)).to be_kind_of(Aggregate::Schema)
      end
    end
  end
end