Feature: Define schema

  Use `schema` to define it's domain with documents and their fields.

  Scenario: Schema defines a document with a field
    Given a code with:
      """ruby
      Aggregate.schema :blog do
        document :post do
          field :body
        end
      end
      """
    When a code with:
      """ruby
      post = Aggregate.schema(:blog).document(:post)
      post.create!(body: 'text')
      """
    Then a code should result with "text":
      """ruby
      Aggregate.schema(:blog).document(:post).first.body
      """