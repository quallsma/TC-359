class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :status
  attr_accessible :body, :status_id, :title
  
  validates :title, :body, :status_id, :presence => true
  validates :title, :uniqueness => true
  
  def is_published?
    if self.status.name == "Published"
      return true
    end
  end
end
