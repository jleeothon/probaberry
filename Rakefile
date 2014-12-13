
# ruby desc "Open an irb session preloaded with this library"

require 'rake'

task :help do
    puts "Usage"
    puts " console   starts a console with probaberry loaded"
    puts " help      shows this help text"
    puts " test      runs all test files"
end

task :console do
    sh "irb -rubygems -I lib -r probaberry.rb"
end

task :default => [:help]

task :test do
    test_files = Rake::FileList.new "test/test_*.rb"
    test_files.each do |test_file|
        ruby "-I lib #{test_file}"
    end
end
