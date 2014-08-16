class Article < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
  validates :content, presence: true, length: { minimum: 2 }, length: { maximum: 500 }
  validates :author_approval,  default: false
  validates :admin_approval,  default: false 
  validates_associated :user


  private
  def self.get_article_object_array(user_id)
    Article.where(user_id: user_id.to_i)
  end

  def self.initiate_for_admin_request(article_id)
  	Article.find(article_id).update_attribute('author_approval', true)
  end

  def self.get_requests_of_author
  	Article.where(author_approval: true)
  end

  def self.admin_approve_for_publishing(article_id)
    Article.find(article_id).update_attribute('admin_approval', true)
  end

  def self.get_articles_to_be_published
    Article.where(admin_approval: true)
  end

  
  def self.search(search)
  if search
    where(['name LIKE ?', "%#{search}%"])
  else
    where(:name)
  end
end

end
