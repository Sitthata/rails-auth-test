class Comment < ApplicationRecord
  def index
    
  end

  private
    def set_comment
      @product = Product.find(params[:id])
    end

    def comment_params
      params.expect(comment: [ :content ])
    end
end
