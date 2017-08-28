module Admin
  class ArticlesController < Admin::ApplicationController
    def index
      @articles = Article.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end

    def show
      @article = Article.friendly.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      @article.user_id = current_user.id
      if @article.save
        redirect_to admin_article_path(@article)
      else
        render 'new'
      end
    end

    def edit
      @article = Article.friendly.find(params[:id])
    end

    def update
      Article.friendly.find(params[:id]).update(article_params)
      redirect_to admin_articles_path
    end

    def destroy
      @article = Article.friendly.find(params[:id])
      @article.destroy
      redirect_to admin_articles_path
    end

    private

    def article_params
      params.require(:article).permit(:published_at, :status, :title, :body, :intro, :tag_list)
    end
  end
end
