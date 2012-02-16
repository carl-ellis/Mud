require 'rake'
require 'rake/testtask'

task :default => [:test_units]

desc "Run tests"
Rake::TestTask.new("test_units") do |t|
	t.pattern = 'test/tc_*.rb'
	t.verbose = true
	t.warning = true
end
