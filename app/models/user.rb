class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :commented_posts, through: :comments, source: :post

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  generates_token_for(:access_token, expires_in: 24.hours) do
    [ email_address ]
  end

  def generate_access_token
    generate_token_for(:access_token)
  end

  def self.find_by_access_token(token)
    find_by_token_for(:access_token, token)
  end
end
