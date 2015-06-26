require "owners"
require "minitest/spec"
require "minitest/autorun"

describe Owners do
  describe "for" do
    before do
      @owners = Owners.new(<<-EOF)
        foo@example.com
        @owner
        @org/team
        @focused *.md
      EOF
    end

    it "returns all users without a path specified" do
      assert_equal ["foo@example.com", "@owner", "@org/team"], @owners.for("README")
    end

    it "returns users with matching path" do
      assert_equal ["foo@example.com", "@owner", "@org/team", "@focused"], @owners.for("README.md")
    end

    it "returns teams with matching path" do
      assert_equal ["@org/legal"], Owners.new("@org/legal LICENSE").for("LICENSE")
    end

    it "returns users matching any path" do
      owners = Owners.new("@user *.rb *.py")
      assert_equal ["@user"], owners.for("foo.rb")
      assert_equal ["@user"], owners.for("foo.py")
    end

    it "does not returns users with non-matching path" do
      assert_equal ["foo@example.com", "@owner", "@org/team"], @owners.for("README")
    end

    it "ignores comments and newlines" do
      assert_equal ["@owner"], Owners.new("# README\n\n\n@owner").for("README")
    end
  end
end
