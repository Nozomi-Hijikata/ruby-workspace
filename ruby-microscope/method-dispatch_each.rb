require 'ripper'

code = <<~STR
  for i in 1..10
    puts i
  end
STR

puts code

puts "\nToken below:"
puts '-----------------'
pp Ripper.lex(code) # トークンの出力

puts "\nAST below:"
puts '-----------------'
pp Ripper.sexp(code) # ASTの出力

puts "\nYARV bytecode below:"
puts '-----------------'
puts RubyVM::InstructionSequence.compile(code).disasm # YARVバイトコードの出力
