
# ruby desc "Open an irb session preloaded with this library"

require 'rake'

task :help do
    puts "Usage"
    puts " console   starts a console with probaberry loaded"
    puts " help      shows this help text"
    puts " test      runs all test files"
end

task :console do
    sh "irb --inspect -rubygems -I lib -r probaberry.rb"
end

task :default => [:help]

task :test, [:testname] do |t, args|
    testnames = args[:testname]
    if testnames then
        testnames = testnames.split
        test_files = Rake::FileList.new
        testnames.each do |testname|
            test_files.include "test/test_#{testname}.rb"
        end
    else
        test_files = Rake::FileList.new "test/test_*.rb"
    end
    test_files.each do |test_file|
        ruby "-I lib --verbose -r 'minitest/autorun' #{test_file}"
    end
end
