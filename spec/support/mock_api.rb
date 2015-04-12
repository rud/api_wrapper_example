if ENV['MOCK_API']
  ApiWrapperExample::Client.mock!
else
  ApiWrapperExample::Client.live!
end
