# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :user_id, Integer, null: false
    field :post_id, Integer, null: false
    field :content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user, UserType, null: false
    field :post, CommentType, null: false
  end
end
