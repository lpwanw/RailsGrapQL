# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType

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

    def ready?(**args)
      if !context[:current_user].present?
        return false, { errors: [ "You don't have permission to do this" ]}
      else
        true
      end
    end
  end
end
