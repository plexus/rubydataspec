begin
  require 'spec_helper'
  require 'clojr'

  describe Clojr::Persistent::Vector do
    it_should_behave_like 'a persistent collection'
    it_should_behave_like 'a persistent vector'
  end

rescue Object => e
  $stderr.puts "Skipping Clojr, #{e}"
end
