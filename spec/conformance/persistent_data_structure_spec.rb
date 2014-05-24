begin
  require 'spec_helper'
  require 'persistent_data_structure'

  describe Persistent::Vector do
    it_should_behave_like 'a persistent collection'
    it_should_behave_like 'a persistent vector'
  end

rescue Object=> e
  $stderr.puts "Skipping Persistent::Vector, #{e}"
end
