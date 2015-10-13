class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def index
    users = User.all
    # image = ["img": "some image"]
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
        # fire off redeemer welcome email
        WelcomeEmailTextRedeemerWorker.perform_async(@user.id)
        # new "redeemer" is redirected to redeemer page
        redirect_to redeemers_path
      else
        # fire off recycler welcome email
        WelcomeEmailTextRecyclerWorker.perform_async(@user.id)
        # new "recycler" is redirected to recycler page
        redirect_to transactions_path
      end
    else
      flash[:errors] = ["Error!"]
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
    # update these attributes on all users
    update_user.update_attributes(first_name: u[:first_name],
                                                    last_name: u[:last_name],
                                                    email: u[:email],
                                                    phone: u[:phone],
                                                    address: u[:address],
                                                    city: u[:city],
                                                    state: u[:state],
                                                    zipcode: u[:zipcode])
    if @user[:function] == "redeemer"
      # update "redeemer" only attributes
      update_user.update_attributes(radius: u[:radius])
    end
    # send_profile_updated_email(@user)
    ProfileUpdatedEmailTextWorker.perform_async(@user.id)

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
