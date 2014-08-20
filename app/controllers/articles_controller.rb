class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article= Article.find(params[:id])
    @list_of_publisher=@article.articles_publishers.buy_approval_true
    @list_of_requested=@article.articles_publishers.buy_approval_false
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    update
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    if @article.save!
      redirect_to user_path(current_user) 
    else
      render 'articles/new'
    end  
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to display_user_article_path(current_user), notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to display_user_article_path(current_user), notice: 'Article was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:articles).permit(:name, :content)
  end
end
