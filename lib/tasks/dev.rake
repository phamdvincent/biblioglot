desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  User.destroy_all

  usernames = ["admin", "user"]

  usernames.each do |username|
    user = User.new
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save
  end

  p "There are now #{User.count} users."
end
