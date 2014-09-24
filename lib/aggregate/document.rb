class Aggregate::Document
  include Mongoid::Document

  store_in collection: 'documents'

  field :raw, type: String
  field :parsed, type: Hash
  field :normalized, type: Hash
end