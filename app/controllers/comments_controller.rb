class CommentsController < ApplicationController
  before_action :set_product, only: %i[:create]
  def index
  end

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @product, notice: "Comment was successfully added."
    else
      redirect_to @product, alert: "Failed to add comment."
    end
  end

  def new
    @comment = Comment.new
  end

  private
  def set_product
    @product = Product.find(params(:product_id))
  end

  def comment_params
    params.expect(product: [ :content ])
  end
end
