require "test_helper"

class CommentTest < ActiveSupport::TestCase
  context "Validations" do
    should belong_to(:user)
    should belong_to(:post)

    should validate_presence_of(:content)
    should validate_length_of(:content).is_at_most(300)
  end
end
