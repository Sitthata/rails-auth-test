class CommentsController < ApplicationController
  before_action :set_product, only: %i[create]
  before_action :authenticate_user!

  def index
  end

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    logger.debug "Current user: #{current_user.inspect}"
    logger.debug "Comment params #{comment_params.inspect}"
    if @comment.save
      logger.debug "Comment saved #{@comment.inspect}"
      redirect_to @product, notice: "Comment was successfully added."
    else
      @comments = @product.comments.order(created_at: :desc)
      logger.debug "Failed to save comment: #{@comment.errors.full_messages.inspect}"
      render "products/show"
    end
  end

  def new
    @comment = Comment.new
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    # params.expect(product: [ :content ])
    params.require(:comment).permit(:content)
  end
end
