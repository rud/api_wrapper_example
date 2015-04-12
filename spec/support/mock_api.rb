if ENV['MOCK_API']
  STDERR.puts 'Running with .mock! server'
  ApiWrapperExample::Client.mock!
else
  STDERR.puts 'Running with .live! server'
  ApiWrapperExample::Client.live!
end
