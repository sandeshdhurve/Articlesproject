class ArticlesPublisher < ActiveRecord::Base
	belongs_to :article
	belongs_to :publisher, class_name: "User", foreign_key: "publisher_id"

	validates :publisher, :article, presence: true
	validates :buy_request, null: false
	validates :buy_approval, null: false 
  scope :buy_approval_true, ->{where(buy_approval: true)}
  scope :buy_approval_false, ->{where(buy_approval: false)}
  scope :publisher, ->(user){where(publisher: user)}

	private

	def self.go_for_update(article)
  	find(article).update_attribute('buy_approval', true)
	end

	def self.get_list_of_published_articles
    buy_approval_true
  end

	def self.get_buy_approval
    buy_approval_false
	end  

  def self.get_if_exist(user)
    publisher(user).first!=nil
  end

  def self.get_all_where_publisher(user)
   publisher(user)
  end

  def self.get_where_publisher_and_buy_approval(user)
    publisher(user).buy_approval_true
  end 
end
