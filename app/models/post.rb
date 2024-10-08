class Post < ApplicationRecord
  belongs_to :user

  enum :visibility, {
    draft: "draft",
    private_post: "private_post",
    published_post: "published_post"
  }

  validates :content, presence: true, length: { maximum: 300 }
end
