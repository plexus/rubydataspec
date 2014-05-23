begin
  require 'spec_helper'
  require 'clojr'

  describe Clojr::Persistent::Vector do
    it_should_behave_like 'PersistentVector'
  end

rescue Object => e
  $stderr.puts "Skipping Clojr, #{e}"
end
