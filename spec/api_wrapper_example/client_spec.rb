require 'spec_helper'

describe ApiWrapperExample::Client, 'mittens index' do
  it 'loads the index as a hash' do
    client = ApiWrapperExample::Client.new
    assert_equal(Hash, client.mittens.class)
  end
end

describe ApiWrapperExample::Client, 'create a mitten' do
  let(:client) { ApiWrapperExample::Client.new }

  it 'can add to the repository' do
    mitten_name = "#{TEST_VERSION}-hilda"

    client.create_mitten(
      name: mitten_name,
      color: 'maroon'
    )

    assert_equal(
      'maroon',
      client.mittens.fetch(mitten_name)
    )
  end

  it 'returns a 201 status when created successfully' do
    mitten_name = "#{TEST_VERSION}-mexico"
    called = false

    client.create_mitten(name: mitten_name, color: 'beige') do |response|
      called = true
      assert_equal(201, response.status)
    end

    assert(called, 'Expected response to be yielded')
  end
end
