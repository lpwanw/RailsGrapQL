class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :delete_all

  has_many :commented_users, through: :comments, source: :user

  enum :visibility, {
    draft: "draft",
    private_post: "private_post",
    published_post: "published_post"
  }

  validates :content, presence: true, length: { maximum: 300 }
end
