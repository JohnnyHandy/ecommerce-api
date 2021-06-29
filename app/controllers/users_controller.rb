class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end
  def show
    render json: @user,  include: [:addresses]
  end
  def update
    if @user.update(update_user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def update_user_params
    params.permit(
      :email,
      :name,
      :phone,
      :gender,
      :birthday,
      :document
    )
  end
end
