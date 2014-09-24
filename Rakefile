# encoding: utf-8
require 'rubygems'
require 'bundler'
require 'rake'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = 'features --format pretty'
end

task :default => [:spec, :cucumber]