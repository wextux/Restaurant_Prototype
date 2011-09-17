namespace :app do
  
  task :ensure_development_environment => environment do
    if Rails.env.production?
      raise "\nCan't Drop production data"
    end
  end
  
  
  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed", "db:populate"]
  
  
  desc "Populate databse with development data."
  task :populate => :environment do
    [
      {:company => "Outback",       :admin_name => "Dave Plakatis",     :date_joined: => 2.months.ago,   :email => "outback@email.com",     :password => "password",  :password_confirmation => "password" },
      {:company => "Olive Garden",  :admin_name => "Jenny Ballyntine",  :date_joined: => 5.months.ago,   :email => "olivegarden@email.com", :password => "password",  :password_confirmation => "password" },
      {:company => "Moxies",        :admin_name => "Fred Costner",      :date_joined: => 2.months.ago,   :email => "moxies@email.com",      :password => "password",  :password_confirmation => "password" },
      {:company => "Fraiser Cafe",  :admin_name => "Tania Smith",       :date_joined: => 1.week.ago,     :email => "fraiser@email.com",     :password => "password",  :password_confirmation => "password" },
      {:company => "Milestones",    :admin_name => "Sara Johnson",      :date_joined: => 3.months.ago,   :email => "milestones@email.com",  :password => "password",  :password_confirmation => "password" },
    ].each do |attributes|
      User.find_or_create_by_company(attributes)
    end
  end
  
  
end