namespace :app do
  
  task :ensure_development_environment => :environment do
    if Rails.env.production?
      raise "\nCan't Drop production data"
    end
  end
  
  
  desc "Reset"
  task :reset => [:ensure_development_environment, "db:drop", "db:create", "db:migrate", "db:seed", "app:populate"]
  
  
  desc "Populate databse with development data."
  task :populate => :environment do
    [
      {:company => "Outback",        :date_joined => Date.today,     :email => "outback@email.com",       :password => "password",  :password_confirmation => "password" },
      {:company => "Olive Garden",   :date_joined => 5.months.ago,   :email => "olivegarden@email.com",   :password => "password",  :password_confirmation => "password" },
      {:company => "Moxies",         :date_joined => 2.months.ago,   :email => "moxies@email.com",        :password => "password",  :password_confirmation => "password" },
      {:company => "Fraiser Cafe",   :date_joined => 1.weeks.ago,    :email => "fraiser@email.com",       :password => "password",  :password_confirmation => "password" },
      {:company => "Milestones",     :date_joined => 3.months.ago,   :email => "milestones@email.com",    :password => "password",  :password_confirmation => "password" },
      {:company => "Wooden Monkey",  :date_joined => 5.weeks.ago,    :email => "woodenmonkey@email.com",  :password => "password",  :password_confirmation => "password" },
    ].each do |attributes|
      User.find_or_create_by_company(attributes)
    end
  end
  
  
end