class Article < ActiveRecord::Base
  belongs_to :user
  has_many :articles_publishers
  has_many :articles, through: :articles_publishers
  validates :name, presence: true, length: { minimum: 2 }, length: { maximum: 50 }
  validates :content, presence: true, length: { minimum: 2 }, length: { maximum: 500 }
  validates :author_approval,  default: false
  validates :admin_approval,  default: false 
  validates_associated :user
  scope :user, ->(user_id){where(user_id: user_id)}
  scope :author_approval, ->{where(author_approval: true)}
  scope :admin_approval, ->{where(admin_approval: true)}

  private

  #def self.get_article_object_array(user_id)
  #  user(user_id)
  #end

  def self.initiate_for_admin_request(article_id)
  	find(article_id).update_attribute('author_approval', true)
  end

  #def self.get_requests_of_author
  #	author_approval
  #end

  def self.admin_approve_for_publishing(article_id)
    find(article_id).update_attribute('admin_approval', true)
  end

  #def self.get_articles_to_be_published
  #  admin_approval
  #end

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    end
  end
end
