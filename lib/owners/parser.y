class Parser
rule
  target  : lines
          | /* nothing */

  lines   : line
          | NEWLINE

  line    : directive
          | COMMENT

  directive  : SET_NOPARENT
             | identifier
             | identifier GLOB

  identifier : USERNAME
             | TEAMNAME
             | EMAIL
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
  tokens << [:END, nil]
end
