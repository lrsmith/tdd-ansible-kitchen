require 'serverspec'

describe user('foo') do
  it { should exist }
  it { should belong_to_group 'foo' }
end
