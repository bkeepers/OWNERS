class Parser
rule
  target  : lines
          | /* nothing */

  lines   : line lines
          | /* nothing */

  line    : directive | comment

  directive  : SET_NOPARENT
             | ASTERISK
             | identifier

  identifier : username
             | team

  username   : MENTION STRING

  team       : MENTION STRING DIVIDER STRING

  glob       : GLOB

  comment    : COMMENT

end

---- header ----

require_relative 'lexer.rb'

---- inner ----

def parse(string)
  scan_setup(string)
  tokens = []
  while token = next_token
    tokens << token
  end
  tokens
end
