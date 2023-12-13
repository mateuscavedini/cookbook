class RecipeCategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_authorization, only: [:new, :create]

  def new
  end

  private

  def check_authorization
    redirect_to root_path, alert: 'Você não tem acesso a esse recurso.' unless current_user.admin?
  end
end