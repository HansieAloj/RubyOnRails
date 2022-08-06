class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
        # @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        #render plain: params[:article]
        @article = Article.new(article_params)
        # render plain: @article.inspect
        if @article.save
            flash[:notice] = "Article was created successfully!"
            # OR redirect_to article_path(@article) 
            #we need to redirect to Prefix i.e article and the corresponding URI
            #example to redirct to show, we need to use Prefix_path/uriExtension = article_path/id    
            #--where Prefix = article and /id = @article
            redirect_to @article
            #OR render 'show'
        else
            #debugger
            render 'new'
            #render retains the instance variable(@article) but redirect_to does't retain the instance variable
        end
    end

    def edit
        # @article = Article.find(params[:id])
    end

    def update 
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully!"
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path , status: :see_other
        #render 'index'   - Here render new will not work as the instance variable is deleted and in the new page as it will give error while iterating on the nil instance variable
    end



    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end