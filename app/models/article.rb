class Article < ActiveRecord::Base
	# validations for articles
	validates_presence_of :title, :body
	# one-to-many relationship with comments 
	has_many :comments
	#one-to-many relationship with user table
	belongs_to :user

    
	has_and_belongs_to_many :categories


	  scope :published, lambda { where("articles.published_at IS NOT NULL") }
  scope :draft, lambda { where("articles.published_at IS NULL") }
  scope :recent, lambda { published.where(["articles.published_at > ?",
1.week.ago.to_date])}
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%") }
  def long_title
    "#{title} - #{published_at}"
  
    def published?
    published_at.present?
  end
end
end
