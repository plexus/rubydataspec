require 'pathname'

ROOT = Pathname(__FILE__).dirname.parent

$LOAD_PATH.unshift ROOT.join('lib').to_s

require 'persistent_vector_spec'



RSpec.configure do |rspec|
  rspec.backtrace_exclusion_patterns = [] if ENV['FULLSTACK']
end
