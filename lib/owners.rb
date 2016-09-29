require "owners/parser"
require "owners/version"

class Owners
  def initialize(string)
    @parser = Parser.new
    @tokens = @parser.parse(string)
    @users, @glob_map = parse_tokens(@tokens)
  end

  def for(path)
    results = []
    results.concat(@users)

    @glob_map.each_pair do |glob, users|
      results.concat(users) if File.fnmatch?(glob, path)
    end

    results.compact
  end

  private

  def parse_tokens(tokens)
    users = []
    globs = {}
    names = []
    name  = nil
    tokens.each do |token, value|
      if token == :COMMENT
        # no op
      elsif token == :NEWLINE
        users.concat(names)
        names = []
        name = nil
      elsif token == :GLOB
        name ||= names.pop
        globs[value] ||= []
        globs[value] << name
      elsif token == :EMAIL || token == :TEAMNAME || token == :USERNAME
        names << value
      elsif token == :END
        users.concat(names)
      end
    end
    [users, globs]
  end
end
