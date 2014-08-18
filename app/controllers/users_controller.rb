  class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @article = Article.search(params[:search])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def display_article
   @arr_objects=Article.get_article_object_array(params[:id])
   @articles_published= ArticlesPublisher.get_list_of_published_articles(params[:id])
  end 

  def display_requests_by_author
    @article=Article.get_requests_of_author
  end

  def display_requests_by_publisher
    @article_from_publisher= ArticlesPublisher.get_buy_approval
  end

  def articles_for_publisher
    @all_published=Article.get_articles_to_be_published

    if ArticlesPublisher.get_if_exist(current_user.id)
      @article_for_publisher=[] 
      Article.get_articles_to_be_published.each do |aobject|
        @condition= false
        ArticlesPublisher.get_all_where_publisher(current_user.id).each do |apobject|
          if aobject.id==apobject.article_id
            @condition= true
            break
          else
            @condition= false
          end
        end
        if @condition== false
          @article_for_publisher << aobject
        end
      end
    else
      @article_for_publisher=Article.get_articles_to_be_published
    end
    @articles_purchased= ArticlesPublisher.get_where_publisher_and_buy_approval(current_user.id)
  end  
  
  
  def admin_to_approve
    request_to_admin.each do |article|
      article= Article.initiate_for_admin_request(article.to_i)
    end
    render 'show'
  end

  def approve_for_publishing
    selected_for_publishing.each do |article|
      Article.admin_approve_for_publishing(article.to_i)
    end
    render 'show'
  end

  def publisher_request_to_admin_to_buy
    request_to_admin_to_buy.each do |article|
      ArticlesPublisher.create(article_id: article, publisher_id: current_user.id, buy_request: true)
    end
    render 'show'
  end

  def approved_for_sell
    selected_to_sell.each do |article|
      ArticlesPublisher.go_for_update(article)
    end
    render 'show'
  end

  def request_to_admin
    common_id_finder(params[:request_to_admin])
  end

  def selected_for_publishing
    common_id_finder(params[:selected_for_publishing])
  end
  
  def request_to_admin_to_buy
    common_id_finder(params[:request_to_admin_to_buy])
  end
  
  def selected_to_sell
    common_id_finder(params[:selected_to_sell])
  end 

  def common_id_finder(parameter)
    @ids = []
    parameter.each do |key,val|
      if val != "0"
        @ids << key
      end
    end
    return @ids
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :role)
  end
end
