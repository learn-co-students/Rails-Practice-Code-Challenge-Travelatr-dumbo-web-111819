class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: { minimum: 31 }

  def total_likes
    likes = 0
    self.posts.each do |p|
      likes += p.likes
    end
    likes
  end

  def featured_post
    self.posts.max_by { |p| p.likes }
  end

  # def destinations_by_visits
  #   destinations = []
  #   self.posts.each do |p|
  #     if destinations[p.destination.id]
  #       destinations[p.destination.id] += 1
  #     else
  #       destinations[p.destination.id] = 1
  #     end
  #   end
  #   if destinations[0]
  #     destinations.sort
  #   else
  #     nil
  #   end
  # end

end

