
# ruby desc "Open an irb session preloaded with this library"

require 'rake'

task :console do
    sh "irb -rubygems -I lib -r probaberry.rb"
end

task :default => [:console]

task :test do
    test_files = Rake::FileList.new "test/test_*.rb"
    test_files.each do |test_file|
        ruby "-I lib #{test_file}"
    end
end