require 'test_helper'

module AdMan
  class KeywordTest < ActiveSupport::TestCase
    test "should not save keyword without name" do
      keyword = AdMan::Keyword.new
      assert !keyword.save, "Saved the post without a keyword name"
    end
  end
  
end
