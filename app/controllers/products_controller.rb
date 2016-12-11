class ProductsController < ApplicationController

  def commented_by_current
    Comment.where(user_id: current_user.id, product_id: params[:id]).count > 0
  end

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @comment = Comment.new

    if current_user
      @commented_by_user = commented_by_current
    end
  end

end


# create_table "products", force: :cascade do |t|
#   t.string   "name"
#   t.text     "description"
#   t.string   "image"
#   t.integer  "price_cents"
#   t.integer  "quantity"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.integer  "category_id"
# end