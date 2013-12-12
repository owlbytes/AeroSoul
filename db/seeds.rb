
Post.create(title: "hashtag Neha", description: "hashtag of Neha", photo: "http://imgur.com/IneJIsn")

Post.create(title: "trash bags", description: "trash + arts", photo: "http://imgur.com/37SmIDu")

Post.create(title: "ne", description: "hashtag of Ne", photo: "http://imgur.com/ozKstxH")


User.create(first_name: "Nehita", last_name: "Shah", role: "admin", email: "nehita@nehita.com", password: "password", confirmed_at: Time.now)

User.create(first_name: "Sophita", last_name: "Chitty", role: "user", email: "sophita@sophita.com", password: "password", confirmed_at: Time.now)

User.create(first_name: "Davito", last_name: "Grill", role: "user", email: "davito@davito.com", password: "password", confirmed_at: Time.now)
