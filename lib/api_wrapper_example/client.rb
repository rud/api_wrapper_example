# An API wrapper example project with builtin mocking
module ApiWrapperExample
  # API accessing client
  class Client
    attr_reader :debug, :base_url, :connection

    def initialize(base_url: 'http://localhost:9020',
                   debug: false)
      @base_url = base_url
      @debug = debug
      @connection = setup_connection
    end

    def self.mock!
      Artifice.activate_with(
        ApiWrapperExample::Mock::ApiServer.new
      )
    end

    def self.live!
      Artifice.deactivate
    end

    # GET /v1/mittens
    def mittens
      get 'v1/mittens'
    end

    # GET /v1/mittens/:name
    def mitten(name:)
      get "v1/mittens/#{name}" do |response|
        yield response if block_given?
      end
    end

    # POST /v1/mittens/:name
    def create_mitten(name:, color:)
      post("v1/mittens/#{name}", color: color) do |response|
        yield response if block_given?
      end
    end

    protected

    def get(path, params = {})
      response = connection.get do |request|
        request.path = path
        request.params = params unless params.empty?
      end
      yield response if block_given?
      response.body
    end

    def post(path, params)
      response = connection.post do |request|
        request.path = path
        request.params = params unless params.empty?
      end
      yield response if block_given?
      response.body
    end

    def setup_connection
      connection = Faraday.new(base_url) do |faraday|
        faraday.request :json

        faraday.response :json
        faraday.response :logger if debug

        faraday.adapter Faraday.default_adapter
      end
      connection.headers[:user_agent] = user_agent
      connection
    end

    def user_agent
      [
        self.class.to_s,
        VERSION
      ].join(' ')
    end
  end
end
