# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :content, String, null: false
    field :visibility, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: false
    field :comments, [ CommentType ]
    field :commented_users, [ UserType ]
  end
end
