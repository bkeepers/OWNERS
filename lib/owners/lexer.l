class Parser
macro
  SET_NOPARENT      \"set noparent\"
  EMAIL             [A-Z0-9a-z\._%\+\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z]{2,6}
  TEAMNAME          @[a-zA-Z0-9\-]+\/[a-zA-Z0-9\-]+
  USERNAME          @[a-zA-Z0-9\-]+
  GLOB              [a-zA-Z0-9_\-\*\?\.]+
  COMMENT           \# [^\"\n\"]*
  NEWLINE           \n
  WHITESPACE        \s
rule
  {SET_NOPARENT}      { [:SET_NOPARENT, text] }
  {EMAIL}             { [:EMAIL, text] }
  {TEAMNAME}          { [:TEAMNAME, text] }
  {USERNAME}          { [:USERNAME, text] }
  {GLOB}              { [:GLOB, text] }
  {COMMENT}           { [:COMMENT, text] }
  {NEWLINE}           { [:NEWLINE, ""] }
  {WHITESPACE}
inner
end
