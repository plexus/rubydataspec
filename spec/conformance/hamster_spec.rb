begin
  require 'spec_helper'
  require 'hamster'

  describe Hamster::Vector do
    it_should_behave_like 'PersistentVector'
  end

rescue Object => e
  $stderr.puts "Skipping Hamster, #{e}"
end
