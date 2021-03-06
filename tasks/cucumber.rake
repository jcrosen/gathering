unless ARGV.any? {|a| a =~ /^gems/} # Don't load anything when running the gems:* tasks

begin
  require 'cucumber/rake/task'

  namespace :cucumber do
    Cucumber::Rake::Task.new({:ok => 'db:test:prepare'}, 'Run features that should pass') do |t|
      t.libs.push 'test_helpers'
      t.fork = true # You may get faster startup if you set this to false
      t.profile = 'default'
    end

    Cucumber::Rake::Task.new({:wip => 'db:test:prepare'}, 'Run features that are being worked on') do |t|
      t.libs.push 'test_helpers'
      t.fork = true # You may get faster startup if you set this to false
      t.profile = 'wip'
    end

    Cucumber::Rake::Task.new({:rerun => 'db:test:prepare'}, 'Record failing features and run only them if any exist') do |t|
      t.libs.push 'test_helpers'
      t.fork = true # You may get faster startup if you set this to false
      t.profile = 'rerun'
    end

    desc 'Run all features'
    task :all => [:ok, :wip]

    task :statsetup do
      require 'rails/code_statistics'
      ::STATS_DIRECTORIES << %w(Cucumber\ features features) if File.exist?('features')
      ::CodeStatistics::TEST_TYPES << "Cucumber features" if File.exist?('features')
    end
  end
  desc 'Alias for cucumber:ok'
  task :cucumber => 'cucumber:ok'

  task :default => :cucumber

  task :features => :cucumber do
    STDERR.puts "*** The 'features' task is deprecated. See rake -T cucumber ***"
  end

  # In case we don't have ActiveRecord, append a no-op task that we can depend upon.
  task 'db:test:prepare' do
  end

  task :stats => 'cucumber:statsetup'
rescue LoadError
  desc 'cucumber rake task not available (cucumber not installed)'
  task :cucumber do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end

end