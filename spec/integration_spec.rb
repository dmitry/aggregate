require 'spec_helper'

describe 'Integration' do
  context 'simple case' do
    describe 'defines schema' do
      before do
        Aggregate.schema :blog do
          document :post do
            field :header
            field :text
          end
        end
      end

      it 'defined schema blog' do
        expect(Aggregate.schema(:blog)).to be_kind_of(Aggregate::Schema)
      end

      it 'defined document in a schema blog' do
        expect(Aggregate.schema(:blog).document_class(:post)).to eq Aggregate::Schema::BlogPost
      end

      describe 'defines resource' do
        before do
          Aggregate.schema(:blog).resource :resource1 do
            all 1.hour do
              get 'http://aggregate.dmitry.io/blog/resource1/' do
              end
            end
          end
        end

        it 'defined resource1' do
          expect(Aggregate.schema(:blog).resource(:resource1)).to be_kind_of(Aggregate::Resource)
        end
      end
    end
  end
end