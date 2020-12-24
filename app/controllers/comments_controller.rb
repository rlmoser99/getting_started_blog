class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  private
    def comment_params
      # This change is missing from v6.1.0
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
