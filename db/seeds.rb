
post1 = Post.create!(title: "Trashbags", artist: "Francisco de Pájaro", commision: "no", description: "interacting energetic figures made out of trash bags on the sidewalk", photo: "/assets/trashbags.JPG", medium: "recycled materials", address: "1 Rivington Street, London, United Kingdom")

post2 = Post.create!(title: "Revolution", artist: "unknown", commision: "no", description: "Uncle Sam wants you to be a part of the revolution", photo: "/assets/revolution.JPG", medium: "stencil and spray paint", address: " Christina Street, London, United Kingdom")

post3 = Post.create!(title: "Hashtag of Ne", artist: "Neha Shah", commision: "no", description: "#Ne", photo: "/assets/hashtagneha.JPG", medium: "stencil and spray paint", address: "3 Rivington Street, London, United Kingdom")


user1 = User.create(first_name: "Nehita", last_name: "Shah", role: "admin", email: "nehita@nehita.com", password: "password", confirmed_at: Time.now)

user2 = User.create(first_name: "Sophita", last_name: "Chitty", role: "user", email: "sophita@sophita.com", password: "password", confirmed_at: Time.now)

user3 = User.create(first_name: "Davito", last_name: "Grill", role: "user", email: "davito@davito.com", password: "password", confirmed_at: Time.now)



#Assign the posts for users
user1.posts << post1
user3.posts << post2
user1.posts << post3
