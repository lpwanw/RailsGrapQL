# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType
    field :errors, [ String ], null: false

    argument :content, String, required: true
    argument :visibility, String

    def resolve(content:, visibility: "draft")
      user = context[:current_user]

      post = Post.new(user:, content:, visibility:)
      if post.save
        {
          post:,
          errors: []
        }
      else
        {
          errors: post.errors.full_messages
        }
      end
    end

    def self.authorized?(obj, ctx)
      super && ctx[:current_user].is_a?(User)
    end
  end
end
