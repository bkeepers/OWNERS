#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.14
# from Racc grammer file "".
#

require 'racc/parser.rb'


require_relative 'lexer.rb'

class Parser < Racc::Parser

module_eval(<<'...end parser.y/module_eval...', 'parser.y', 33)

def parse(string)
  scan_setup(string)
  tokens = []
  while token = next_token
    tokens << token
  end
  tokens
end
...end parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     6,     7,    11,     6,     7,    11,    12,    15,    13,    12,
    16,    17,    18 ]

racc_action_check = [
     0,     0,     0,     3,     3,     3,     0,    11,     1,     3,
    13,    15,    17 ]

racc_action_pointer = [
    -2,     8,   nil,     1,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,     2,   nil,    10,   nil,     5,   nil,     7,   nil ]

racc_action_default = [
    -2,   -16,    -1,    -4,    -5,    -6,    -7,    -8,    -9,   -10,
   -11,   -16,   -15,   -16,    -3,   -12,    19,   -16,   -13 ]

racc_goto_table = [
     2,     1,   nil,    14 ]

racc_goto_check = [
     2,     1,   nil,     2 ]

racc_goto_pointer = [
   nil,     1,     0,   nil,   nil,   nil,   nil,   nil,   nil,   nil ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     8,     9,    10,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 10, :_reduce_none,
  0, 10, :_reduce_none,
  2, 11, :_reduce_none,
  0, 11, :_reduce_none,
  1, 12, :_reduce_none,
  1, 12, :_reduce_none,
  1, 13, :_reduce_none,
  1, 13, :_reduce_none,
  1, 13, :_reduce_none,
  1, 15, :_reduce_none,
  1, 15, :_reduce_none,
  2, 16, :_reduce_none,
  4, 17, :_reduce_none,
  1, 18, :_reduce_none,
  1, 14, :_reduce_none ]

racc_reduce_n = 16

racc_shift_n = 19

racc_token_table = {
  false => 0,
  :error => 1,
  :SET_NOPARENT => 2,
  :ASTERISK => 3,
  :MENTION => 4,
  :STRING => 5,
  :DIVIDER => 6,
  :GLOB => 7,
  :COMMENT => 8 }

racc_nt_base = 9

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "SET_NOPARENT",
  "ASTERISK",
  "MENTION",
  "STRING",
  "DIVIDER",
  "GLOB",
  "COMMENT",
  "$start",
  "target",
  "lines",
  "line",
  "directive",
  "comment",
  "identifier",
  "username",
  "team",
  "glob" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser