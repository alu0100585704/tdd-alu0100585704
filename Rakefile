require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :spec do
  sh "rspec -I. spec/tdd-alu0100585704_spec.rb"
end
