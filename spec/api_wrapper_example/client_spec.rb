require 'spec_helper'

describe ApiWrapperExample::Client, 'mittens' do
  it 'loads the empty index' do
    client = ApiWrapperExample::Client.new
    assert_equal({}, client.mittens)
  end
end
