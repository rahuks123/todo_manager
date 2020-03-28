class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.display }.join("\n")
  end

  def create
    email = params[:email]
    password = params[:password]
    name = params[:name]
    new_user = User.create!(
      email: email,
      password: password,
      name: name,
    )
    render plain: "the new record is created with id #{new_user.id} "
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.display
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by "email = ? and password = ?", email, password
    if (user)
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
