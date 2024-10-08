# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    field :comment, Types::CommentType

    argument :content, String, required: true
    argument :post_id, ID, required: true

    def resolve(content:, post_id:)
      user = context[:current_user]

      comment = user.comments.new(post_id:, content:)
      if comment.save
        {
          comment:,
          errors: []
        }
      else
        {
          errors: comment.errors.full_messages
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

    private

    field :post, Types::PostType
  end
end
