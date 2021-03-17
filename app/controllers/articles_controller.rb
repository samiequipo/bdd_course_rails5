class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show]
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    @article = Article.new(article_params) 
    
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path 
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end

  protected
    def resource_not_found
      message = "The article you are looking for could not be found" 
      flash[:danger] = message
      redirect_to root_path
    end
    
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end 
    
    def set_article
      @article = Article.find(params[:id]) 
    end
end
