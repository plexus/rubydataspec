begin
  require_relative '../vector'
  require 'persistent_data_structure'

  describe Persistent::Vector do
    it_should_behave_like 'Vector'
  end

rescue => e
  $stderr.puts "Skipping Persistent::Vector, #{e}"
end
