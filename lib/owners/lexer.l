class Parser
macro
  SET_NOPARENT      \"set noparent\"
  ASTERISK          \*
  MENTION           \@
  DIVIDER           \/
  NAME              [a-zA-Z0-9\-]+
  GLOB              [a-zA-Z0-9_\-\*\?]+
  COMMENT           \# [^\"\n\"]*
  WHITESPACE        \s+
  NEWLINE           \n
rule
  {SET_NOPARENT}      { [:SET_NOPARENT, text] }
  {ASTERISK}          { [:ASTERISK, text] }
  {MENTION}           { [:MENTION, text] }
  {DIVIDER}           { [:DIVIDER, text] }
  {NAME}              { [:NAME, text] }
  {GLOB}              { [:GLOB, text] }
  {COMMENT}           { [:COMMENT, text] }
  {WHITESPACE}
  {NEWLINE}
inner
end
