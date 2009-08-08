namespace :import do
  namespace :data do
    desc "Generate Games"
    task :game => :environment do
      puts "********** GAME **********"
      
      game = Game.new
      game.user = User.first
      game.name = "rFactor"
      game.alias = "rfactor"
      game.website_url = "http://rfactor.net"
      game.save!
    end
    
    desc "Generate Users"
    task :users => :environment do
      puts "********** USERS **********"
      
      users_to_create = [
        { :email => 'user@example.com',       :real_name => 'Sandra Schneidereit',      :nick_name => 'Musterfrau',    :gender => :female },
        { :email => 'editor@example.com',       :real_name => 'Zaphod Beeblebrox',      :nick_name => 'Schneidereit',    :gender => :male },
      ]
      
      users_to_create.each do |user_hash|
        user = User.new(user_hash)
        user.password = "testtest"
        user.password_confirmation = "testtest"
        user.role = "modder"
        user.save!
      end
    end
    
    desc "Generate Team"
    task :teams => :environment do
      puts "********** TEAM **********"
      
      team = Team.new
      team.user = User.first
      team.name = "Cars & Tracks Development Project"
      team.description = "High quality mods for rFactor"
      team.website_url = "http://ctdp.net"
      team.email = "info@ctdp.net"
      team.save!
    end
    
    desc "Generate Mods"
    task :mods => :environment do
      puts "********** MODS **********"
      21.times do |count|
        mod = Mod.new
        mod.game = Game.first
        mod.user = User.first
        mod.team = Team.first
        mod.title = "F1-20#{count}"
        mod.short_description = "F1-20#{count} is the best mod released"
        mod.description = "F1-20#{count} is the best rFactor mod released in 2006. We got prove!"
        mod.credits = "All members of the team"
        mod.website_url = "http://ctdp.net/f1-2006.html"
        mod.status = :accepted
        mod.save!
      end
    end
    
    desc "Generate Releases"
    task :releases => :environment do
      puts "********** RELEASES **********"
      3.times do |count|
        release = Release.new
        release.mod = Mod.first
        release.user = User.first
        release.title = "Standard Edition"
        release.status = :public
        release.version = "Version #{count}"
        release.change_log = "Everything new with more bitches!"
        release.save!
      end
    end
    
    desc "Generate Mirrors"
    task :mirrors => :environment do
      puts "********** MIRRORS **********"
      12.times do |count|
        mirror = Mirror.new
        mirror.release = Release.first
        mirror.user = User.first
        mirror.title = "Mirror #{count}"
        mirror.download_url = "http://download.example.com/#{count}"
        mirror.status = :public
        mirror.save!
      end
    end
    
    desc "Generates All"
    task :all => [:users, :game, :teams, :mods, :releases, :mirrors]
  end
end
