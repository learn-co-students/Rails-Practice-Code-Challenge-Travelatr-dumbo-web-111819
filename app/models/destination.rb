class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  # The most recent 5 posts written about this destination
  def featured_post
    self.posts.max_by {|p| p.likes}
  end
  
  def bloggers_average_age
    age = 0
    self.bloggers.each do |b|
      age += b.age
    end
    age/(self.bloggers.count)
  end

end
