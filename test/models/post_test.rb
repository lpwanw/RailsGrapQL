require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(content: "This is a test post", visibility: "draft")
  end

  context "Validations" do
    should belong_to(:user)

    should validate_presence_of(:content)
    should validate_length_of(:content).is_at_most(300)

    # Test enum for visibility
    should define_enum_for(:visibility).with_values({
                                                      draft: "draft",
                                                      private_post: "private_post",
                                                      published_post: "published_post"
                                                    })
                                       .backed_by_column_of_type(:string)
  end
end
