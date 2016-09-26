require "owners"
require "minitest/spec"
require "minitest/autorun"

describe Owners::Parser do
  it "parses" do
    @parser = Owners::Parser.new
    @parser.parse("u")
  end
end
