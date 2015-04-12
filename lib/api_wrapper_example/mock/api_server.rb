require 'sinatra'

module ApiWrapperExample
  module Mock
    # Simple in-memory API server implementation
    class ApiServer < ::Sinatra::Base
      REPO = {}

      get '/v1/mittens' do
        JSON.dump(REPO)
      end

      post '/v1/mittens/:name' do |name|
        REPO[name] = params[:color]
        [201, JSON.dump('status' => 'ok')]
      end

      # Fallback to ease implementing missing methods:
      get '/*' do |path|
        warn "GET #{path} (#{params.inspect}) - unsupported"
        incomplete_mock
      end

      # Fallback to ease implementing missing methods:
      post '/*' do |path|
        warn "POST #{path} (#{params.inspect}) - unsupported"
        incomplete_mock
      end

      private

      def incomplete_mock
        [
          418, # "I am a Teapot"
          JSON.dump(
            'message' => [
              request.request_method,
              request.path
            ].join(' '),
            'details' => { 'params' => params }
          )
        ]
      end
    end
  end
end
