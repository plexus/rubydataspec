require 'spec_helper'
require 'ruby_data/persistent_vector'

describe RubyData::PersistentVector do
  it_should_behave_like 'a persistent collection'
  it_should_behave_like 'a persistent vector'
end
