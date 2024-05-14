require 'benchmark'
require 'net/http'

puts "YJIT Enabled: #{RubyVM::YJIT.enabled?}"

Benchmark.bm(10) do |x|
  x.report('for loop:') do
    for i in 1..10_000_000
      a = 'test'
    end
  end

  x.report('times:') do
    10_000_000.times do
      a = 'test'
    end
  end

  x.report('upto:') do
    1.upto(10_000_000) do
      a = 'test'
    end
  end
end

