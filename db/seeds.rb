# encoding: UTF-8
#creates a method so that rails can find, read, and show pictures for the index/show pages
def read_asset(path)
  File.open File.join(Rails.root, path)
end



#creates some users and admins
user1 = User.create(first_name: "Nehita", last_name: "Shah", role: "admin", email: "neshah07@gmail.com", password: "password", confirmed_at: Time.now)


