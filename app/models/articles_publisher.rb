class ArticlesPublisher < ActiveRecord::Base
	belongs_to :article
	belongs_to :publisher, class_name: "User", foreign_key: "publisher_id"

	validates :publisher, :article, presence: true
	validates :buy_request, null: false
	validates :buy_approval, null: false 

	private

	def self.go_for_update(article)
  	find(article).update_attribute('buy_approval', true)
	end

	def self.get_list_of_published_articles(user_id)
    where(buy_approval: true )
  end

	def self.get_buy_approval
    where(buy_approval: false)
	end  

  def self.get_if_exist(user)
    where(publisher: user).first!=nil
  end

  def self.get_all_where_publisher(user)
    where(publisher: user)
  end

  def self.get_where_publisher_and_buy_approval(user)
    where(publisher_id: user, buy_approval: true)
  end 
end
