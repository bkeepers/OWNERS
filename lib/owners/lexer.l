class Parser
macro
  BLANK         \s+
  DIGIT         \d+
rule
  {BLANK}
  {DIGIT}       { [:NUMBER, text.to_i] }
  .|\n          { [:TEXT, text] }
inner
end
