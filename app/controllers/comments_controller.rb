class CommentsController < ApplicationController
  # not sure how to implement this right now, and logic exists to block non-users from reviewing
  # before_filter :authorize_user

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.product_id = params[:product_id]

    if @comment.save
      redirect_to request.referrer, notice: 'Comment created!'
    else
      redirect_to "/products/#{params[:product_id]}",
        notice: 'Unable to save comment'
    end
  end

  def destroy
    @comment = Comment.find params[:id]

    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to request.referrer, notice: 'Comment deleted!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :rating,
      :content
      )
  end
end



# class CreateComments < ActiveRecord::Migration
#   def change
#     create_table :comments do |t|
#       t.text :content
#       t.integer :rating
#       t.integer :product_id
#       t.integer :user_id
#       t.timestamps null: false
#     end
#     add_index :comments, :product_id
#     add_index :comments, :user_id
#   end
# end
