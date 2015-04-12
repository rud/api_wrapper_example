require 'bundler/gem_tasks'
require 'rake/testtask'

namespace :test do
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # run with .rubocop.yml config:
    task.options = [
      '--config', '.rubocop.yml',
      '--fail-level', 'W'
    ]
    # only show the files with failures
    task.formatters = %w(clang offenses)
    # silence "Running RuboCop..." output:
    task.verbose = ENV['CI']
    # abort rake on failure
    task.fail_on_error = true
  end
end

desc 'Run tests against live API server'
Rake::TestTask.new('test:live' => 'test:live:setup') do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = false
end

desc 'Run tests against mock API server'
Rake::TestTask.new('test:mock' => 'test:mock:setup') do |t|
  t.libs << 'spec'
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = false
end

task 'test:live:setup' do
  ENV['MOCK_API'] = nil
end

task 'test:mock:setup' do
  ENV['MOCK_API'] = 'true'
end

desc 'Run tests against both live and mock API server'
task 'test:all' => ['test:live', 'test:mock', 'test:rubocop']

task default: 'test:all'

desc 'Do what a CI server would do'
task ci: ['test:mock', 'test:rubocop']
