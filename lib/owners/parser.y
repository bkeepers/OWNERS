class Parser
  prechigh
    nonassoc UMINUS
    left '*' '/'
    left '+' '-'
  preclow
  options no_result_var
rule
  target  : char
          | /* nothing */ { "" }

  char    : TEXT { puts "HELLO U" }
end

---- header ----

require_relative 'lexer.rb'

---- inner ----

def parse(string)
  parser = Parser.new
  parser.scan_str(string)
end
