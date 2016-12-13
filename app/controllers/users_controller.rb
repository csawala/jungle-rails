class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    @user = @user.email.downcase.strip
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end


# class CreateUsers < ActiveRecord::Migration
#   def change
#     create_table :users do |t|
#       t.string :first_name
#       t.string :last_name
#       t.string :email
#       t.string :password

#       t.timestamps null: false
#     end
#   end
# end
