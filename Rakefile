require "bundler/gem_tasks"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => [:test]

desc "Use Rex & Racc to regenerate parser.rb & lexer.rb from configuration files"
task :build_parser do
  `rm lib/owners/parser.rb lib/owners/lexer.rb`
  `bundle exec rex lib/owners/lexer.l -o lib/owners/lexer.rb`
  `bundle exec racc lib/owners/parser.y -o lib/owners/parser.rb`
end
