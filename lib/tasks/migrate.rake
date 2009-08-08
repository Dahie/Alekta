namespace :db do
  desc "Drop then recreate the dev database, migrate up, and load fixtures" 
  task :remigrate => :environment do
    return unless %w[development test staging].include? RAILS_ENV
    ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.drop_table t }
    Rake::Task["db:migrate"].invoke
  end
  
  namespace :migrate do
    desc "Automigrating everything"
    task :everything => :environment do
      puts "__________ Automigrating everything __________"
      puts "1. Remigrating db"
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      puts "2. Importing test data"
      Rake::Task["import:data:all"].invoke
    end
  end
end