class UsersController < Clearance::UsersController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = user_from_params

    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @listing = Listing.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params.permit!)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    avatar = user_params.delete(:avatar)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.avatar = avatar
    end
  end

end