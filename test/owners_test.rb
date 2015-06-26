require "owners"
require "minitest/spec"
require "minitest/autorun"

describe Owners do
  describe "for" do
    before do
      @owners = Owners.new(<<-EOF)
        foo@example.com
        @owner
        @focused *.md
      EOF
    end

    it "returns all users without a path specified" do
      assert_equal ["foo@example.com", "@owner"], @owners.for("README")
    end

    it "returns users with matching path" do
      assert_equal ["foo@example.com", "@owner", "@focused"], @owners.for("README.md")
    end

    it "does not returns users with non-matching path" do
      assert_equal ["foo@example.com", "@owner"], @owners.for("LICENSE")
    end

    it "ignores comments and newlines" do
      assert_equal ["@owner"], Owners.new("# README\n\n\n@owner").for("README")
    end
  end
end
