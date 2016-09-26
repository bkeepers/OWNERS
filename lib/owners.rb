require "owners/parser"
require "owners/version"

class Owners
  FORMAT = /
    ^                   # beginning of line
    \s*
    (@?[\w@\.\/-]+)     # username, team, or email address
    \s*
    ([\w\*\?\.\s-]+)*   # file globs
    $                   # end of line
  /x

  def initialize(string)
    @lines = string.scan(FORMAT).map { |match| match.compact }
  end

  def for(path)
    @lines.map do |user, globs|
      user if !globs || globs.split(" ").any? {|glob| File.fnmatch?(glob, path) }
    end.compact
  end
end
