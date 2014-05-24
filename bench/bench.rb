require 'benchmark/ips'
require 'ruby_data/persistent_vector'

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

classes_to_test << RubyData::PersistentVector

classes_to_test.each do |klass|
  Benchmark.ips do |x|
    ary     = [*1..1000]
    big_ary = [*1..100_000]

    vector = klass[*ary]
    big_vector = klass[*big_ary]

    x.report "#{klass}[1000 items]" do
      vector = klass[*ary]
    end

    x.report "#{klass}[100_000 items]" do
      vector = klass[*big_ary]
    end

    x.report "#{klass}#add - 1000 items" do
      v = klass[]
      ary.count.times { |i| v = v.add(i) }
    end

    x.report "#{klass}#add - 100_000 items" do
      v = klass[]
      big_ary.count.times { |i| v = v.add(i) }
    end

    x.report "#{klass}#to_a" do
      vector.to_a
    end

    x.report "#{klass}#inspect" do
      vector.inspect
    end
  end
end
