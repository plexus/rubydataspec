require_relative './vector'

RSpec.configure do |rspec|
  rspec.backtrace_exclusion_patterns = [] if ENV['FULLSTACK']
end
