require 'aggregate'
require 'rspec'

RSpec.configure do |c|
  c.before(:each) do
    Aggregate.clear
  end
end