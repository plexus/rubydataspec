require 'benchmark/ips'

# For comparison
class TransientArray < Array
  def add(x)
    self << x
  end
end

class PersistentArray < Array
  def add(x)
    self.dup << x
  end
end

classes_to_test = []

begin
  require 'persistent_data_structure'
  classes_to_test << Persistent::Vector
rescue LoadError => e
  $stderr.puts "Skipping Persistent::Vector, #{e}"
end

begin
  require 'hamster'
  classes_to_test << Hamster::Vector
rescue LoadError => e
  $stderr.puts "Skipping Hamster::Vector, #{e}"
end

classes_to_test << TransientArray
classes_to_test << PersistentArray

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
