require 'benchmark/ips'
require 'ruby_data/vector'

classes_to_test = []

begin
  require 'persistent_data_structure'
  classes_to_test << Persistent::Vector
rescue Object => e
  $stderr.puts "Skipping Persistent::Vector, #{e}"
end

begin
  require 'hamster'
  classes_to_test << Hamster::Vector
rescue Object => e
  $stderr.puts "Skipping Hamster::Vector, #{e}"
end

begin
  require 'clojr'
  classes_to_test << Clojr::Persistent::Vector
rescue Object => e
  $stderr.puts "Skipping Clojr::Persistent::Collection::Vector, #{e}"
end

classes_to_test << RubyData::Vector

classes_to_test.each do |klass|
  Benchmark.ips do |x|
    ary = [*1..100000]

    x.report "#{klass} from Array" do
      vector = klass[*ary]
    end

    x.report "#{klass}#add" do
      v = klass[*ary]
      100000.times { |i| v = v.add(i) }
    end
  end
end
