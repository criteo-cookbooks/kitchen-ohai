require 'foodcritic'
require 'rubocop/rake_task'

FoodCritic::Rake::LintTask.new
RuboCop::RakeTask.new

task default: %i[rubocop foodcritic]
