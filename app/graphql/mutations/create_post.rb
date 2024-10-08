# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType
    field :errors, [ String ], null: false

    argument :content, String, required: true
    argument :visibility, String

    def resolve(content:, visibility: "draft")
      user = User.first

      post = Post.new(user:, content:, visibility:)
      if post.save
        {
          post:,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
