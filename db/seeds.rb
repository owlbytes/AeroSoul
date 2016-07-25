# encoding: UTF-8
#creates a method so that rails can find, read, and show pictures for the index/show pages
def read_asset(path)
  File.open File.join(Rails.root, path)
end


# user = User.find_or_initialize_by(email: 'test@example.com')
# user.update_attributes(username: 'Test', ...)


#creates some users and admins
user1 = User.create(first_name: "Test", last_name: "One", role: "admin", email: "test1@mailinator.com", username: "Test1", instagram:"test1", twitter:"test1", password:"password", confirmed_at: Time.now)

user2 = User.create(first_name: "Test", last_name: "Two", role: "user", email: "test2@mailinator.com", username: "Test2", instagram:"test2", twitter:"test2", password:"password", confirmed_at: Time.now)

user3 = User.create(first_name: "Test", last_name: "Three", role: "user", email: "test3@mailinator.com", username: "Test3", instagram:"test3", twitter:"test3", password:"password", confirmed_at: Time.now)

user4 = User.create(first_name: "Test", last_name: "Four", role: "user", email: "test4@mailinator.com", username: "Test4", instagram:"test4", twitter:"test4", password:"password", confirmed_at: Time.now)

user5 = User.create(first_name: "Test", last_name: "Five", role: "user", email: "test5@mailinator.com", username: "Test5", instagram:"test5", twitter:"test5", password:"password", confirmed_at: Time.now)

user6 = User.create(first_name: "Test", last_name: "Six", role: "user", email: "test6@mailinator.com", username: "Test6", instagram:"test6", twitter:"test6", password:"password", confirmed_at: Time.now)

