require 'rake'
require 'rake/testtask'

task :default => [:test_units_core, :test_units_json]

desc "Run core tests"
Rake::TestTask.new("test_units_core") do |t|
	t.verbose = true
	t.warning = false
	t.test_files = Rake::FileList[ 	"./test/tc_area.rb",
										"./test/tc_template.rb",
										"./test/tc_mob_template.rb",
										"./test/tc_item_template.rb",
										"./test/tc_item.rb",
										"./test/tc_mob.rb",
										"./test/tc_direction.rb",
										"./test/tc_door.rb",
										"./test/tc_room.rb",
										"./test/tc_player.rb",
										"./test/tc_password.rb",
										"./test/tc_repository.rb",
										"./test/tc_freeid.rb",
										]
end

desc "Run json tests"
Rake::TestTask.new("test_units_json") do |t|
	t.verbose = true
	t.warning = false
	t.test_files = Rake::FileList[ 	
										"./test/tc_freeid_json.rb",
										"./test/tc_repository_json.rb"
										]
end
