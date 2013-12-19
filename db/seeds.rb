
#creates a method so that rails can find, read, and show pictures for the index/show pages
def read_asset(path)
  File.read File.join(Rails.root, path)
end


#posts for all! 
post1 = Post.create!(title: "Trashbags", artist: "Francisco de Pájaro", commision: "no", description: "interacting energetic figures made out of trash bags on the sidewalk", photo: read_asset("/app/assets/images/seeds/trashbags.jpg"), medium: "recycled materials", address: "1 Rivington Street, London, United Kingdom", tag_list: "Trashbags, recycled")

post2 = Post.create!(title: "Revolution", artist: "unknown", commision: "no", description: "Uncle Sam wants you to be a part of the revolution", photo: read_asset("/app/assets/images/seeds/revolution.jpg"), medium: "stencil and spray paint", address: " Christina Street, London, United Kingdom", tag_list: " Revolution, politics")

post3 = Post.create!(title: "Hashtag of Ne", artist: "Neha Shah", commision: "no", description: "#Ne", photo: read_asset("/app/assets/images/seeds/hashtagneha.jpg"), medium: "stencil and spray paint", address: "3 Rivington Street, London, United Kingdom", tag_list: "tag, hashtag")

post4 = Post.create!(title: "Animals", artist: "unknown", commision: "unknown", description: "Various animals heaped on top of each other", photo: read_asset("/app/assets/images/seeds/ranimal.jpg"), medium: "spray paint", address: "3 Rivington Street, London, United Kingdom", tag_list: "animals")

post5 = Post.create!(title: "Cash Machine", artist: "Banksy", commision: "no", description: "Girl & an ATM machine. Has two white stripes covering part of the piece.", photo: read_asset("/app/assets/images/seeds/banksy.jpg"), medium: "spray paint", address: "114b Farringdon Road, London, United Kingdom", tag_list:" capitalism, politics, Banksy")

post6 = Post.create!(title: "Bird & Snake", artist: "unknown", commision: "unknown", description: "A colorful scene featuring a bird and snake", photo: read_asset("/app/assets/images/seeds/bird_and_snake.jpg"), medium: "spray paint", address: "3 Rivington Street, London, United Kingdom", tag_list: "animals")

post7 = Post.create!(title: "Skull", artist: "unknown", commision: "unknown", description: "A striking skull presides over Shoreditch", photo: read_asset("/app/assets/images/seeds/blackskull.jpg"), medium: "unknown", address: "3 Rivington Street, London, United Kingdom", tag_list: "skull, scultpure")

post8 = Post.create!(title: "Buzz", artist: "unknown", commision: "unknown", description: "Cartoonish figures appear on Old Street, including Buzz Lightyear", photo: read_asset("/app/assets/images/seeds/buzz.jpg"), medium: "spray paint", address: "237 Old Street, London, United Kingdom", tag_list: "cartoons, Disney")

post9 = Post.create!(title: "Figure", artist: "unknown", commision: "unknown", description: "Colorful figure", photo: read_asset("/app/assets/images/seeds/dude.jpg"), medium: "spray paint", address: "Ravey Street, London, United Kingdom", tag_list: "figures")

post10 = Post.create!(title: "No Plan", artist: "unknown", commision: "unknown", description: "There is no plan!", photo: read_asset("/app/assets/images/seeds/no_plan.jpg"), medium: "spray paint", address: "3 Rivington Street, London, United Kingdom")

post11 = Post.create!(title: "Reach", artist: "unknown", commision: "unknown", description: "Reaching Man", photo: read_asset("/app/assets/images/seeds/reaching_man.jpg"), medium: "spray paint", address: "3 Rivington Street, London, United Kingdom")

post12 = Post.create!(title: "Shop Till You Drop", artist: "Banksy", commision: "no", description: "A woman falling with her shopping trolley", photo: read_asset("/app/assets/images/seeds/shop_till_you_drop.jpg"), medium: "spray paint, stencil", address: "Bruton St, Mayfair, London W1J 6QD, UK", tag_list: "capitalism, Banksy")


#creates some users and admins
user1 = User.create(first_name: "Nehita", last_name: "Shah", role: "admin", email: "nehita@nehita.com", password: "password", confirmed_at: Time.now)

user2 = User.create(first_name: "Sharif", last_name: "Zu'bi", role: "user", email: "szubi@me.com", password: "password", confirmed_at: Time.now)

user3 = User.create(first_name: "Davito", last_name: "Grill", role: "user", email: "davito@davito.com", password: "password", confirmed_at: Time.now)

user4 = User.create(first_name: "Neha", last_name: "Shah", role: "admin", email: "neshah07@gmail.com", password: "password", confirmed_at: Time.now)


#Assign the posts for users
user4.posts << post1
user4.posts << post2
user4.posts << post3
user4.posts << post4
user4.posts << post5
user4.posts << post6
user4.posts << post7
user4.posts << post8
user4.posts << post9
user4.posts << post10
user4.posts << post11
user2.posts << post12
