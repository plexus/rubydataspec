begin
  require 'spec_helper'
  require 'hamster'

  describe Hamster::Vector do
    it_behaves_like 'Vector'
  end

rescue LoadError => e
  $stderr.puts "Skipping Hamster, #{e}"
end
