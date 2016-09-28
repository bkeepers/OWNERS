require "owners"
require "minitest/spec"
require "minitest/autorun"

describe Owners::Parser do
  it "parses" do
    @parser = Parser.new
    tokens = @parser.parse("@hello")
    token = tokens.shift
    assert_equal [:USERNAME, "@hello"], token
  end
end
