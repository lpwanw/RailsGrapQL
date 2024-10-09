# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :email_address, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :posts, [ PostType ]
    field :comments, [ CommentType ]
    field :commented_posts, [ PostType ]
  end
end
