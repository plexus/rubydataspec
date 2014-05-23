begin
  require 'spec_helper'
  require 'clojr'

  describe Clojr::Persistent::Vector do
    it_behaves_like 'Vector'
  end

rescue LoadError => e
  $stderr.puts "Skipping Clojr, #{e}"
end
