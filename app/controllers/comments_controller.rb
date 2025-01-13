class CommentsController < ApplicationController
  def index
  end

  private
  def set_product
    @product = Product.find(params(:product_id))
  end

  def comment_params
    params.expect(product: [ :content ])
  end
end
