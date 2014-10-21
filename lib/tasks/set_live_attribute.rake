task :set_live_attribute => :environment do
  Post.all.each do |post|
    post.live = true
    post.save
  end
end