require 'ripper'

code = <<~STR
  10.times do |n|
    puts n
  end
STR

puts code
puts '-----------------'
pp Ripper.lex(code) # トークンの出力
puts '-----------------'
pp Ripper.sexp(code) # ASTの出力
puts '-----------------'
puts RubyVM::InstructionSequence.compile(code).disasm # YARVバイトコードの出力
