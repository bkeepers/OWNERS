require "owners"
require "minitest/spec"
require "minitest/autorun"

describe Owners::Parser do
  it "parses" do
    @parser = Owners::Parser.new
    tokens = @parser.parse("@hello")
    token = tokens.shift
    assert_equal [:MENTION, "@"], token
    token = tokens.shift
    assert_equal [:NAME, "hello"], token
  end
end
