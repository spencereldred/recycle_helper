class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def index
    if current_user
      if current_user.function == 'super_admin'
        users = User.all
      else
        users = User.where(group_id: current_user.group_id)
      end
    elsif !current_user
      users = Group.all
    end
    respond_to do |format|
      format.html
      format.json { render :json => users }
    end
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
    @function = params[:function]
  end

  def create
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)
      if @user.function == "redeemer"
        WelcomeEmailRedeemerWorker.perform_async(@user.id)
        WelcomeTextRedeemerWorker.perform_async(@user.id)
        redirect_to admin_path
      else
        WelcomeEmailRecyclerWorker.perform_async(@user.id)
        WelcomeTextRecyclerWorker.perform_async(@user.id)
        redirect_to transactions_path
      end
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @function = @user[:function]

  end

  def update
    @user = current_user
    update_user = User.find(params[:id])
    u = params[:user]
    update_user.update_attributes(first_name: u[:first_name],
                                  last_name:  u[:last_name],
                                  email:      u[:email],
                                  phone:      u[:phone],
                                  address:    u[:address],
                                  city:       u[:city],
                                  state:      u[:state],
                                  zipcode:    u[:zipcode])
    if @user[:function] == "redeemer" || @user[:function] == "admin" || @user[:function] == "super_admin"
      update_user.update_attributes(radius: u[:radius])
    end

    ProfileUpdatedEmailWorker.perform_async(@user.id)
    ProfileUpdatedTextWorker.perform_async(@user.id)

    sign_in(update_user) # need to sign in because the session token has changed
    if current_user.function == "redeemer"
      redirect_to redeemers_path
    else
      redirect_to transactions_path
    end
  end

  def destroy
    user = current_user
    User.delete(user[:id])
    sign_out
    redirect_to root_path
  end

end
