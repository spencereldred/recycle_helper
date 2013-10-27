class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def show
    @user = current_user
  end

  def new
    @user = User.new
    @function = params[:function]
  end

  def create
    @user = User.create(params[:user])

    if @user.save
        # automail welcome message to new user
        Hi5Mailer.welcome_user(@user).deliver
      end

    if @user.errors.empty?
      sign_in(@user)
      # TODO change where app goes after user created
      if @user.function == "redeemer"
        # new "redeemer" is redirected to redeemer page
        redirect_to redeemers_path
      else
        # new "recycler" is redirected to recycler page
        redirect_to new_transaction_path
      end
    else
      flash[:errors] = ["Error!"]
      render :new
    end
  end

  def edit
    @user = current_user

  end

  def update
    @user = current_user
    update_user = User.find(params[:id])
    u = params[:user]
    #TODO need to add longitude and latitude to model
    # update these attributes on all users
    update_user.update_attributes(first_name: u[:first_name], last_name: u[:last_name], email: u[:email], phone: u[:phone])
    if @user[:function] == "redeemer"
      # update "redeemer" only attributes
      update_user.update_attributes(dmv_number: u[:dmv_number])
    else
      # update "recycler" only attributes
      update_user.update_attributes(address: u[:address], city: u[:city], state: u[:state], zipcode: u[:zipcode])
    end
    # need to sign in because the session token has changed
    sign_in(update_user)
    redirect_to user_path(@user[:id])
  end

  def destroy
    user = current_user
    User.delete(user[:id])
    sign_out
    redirect_to root_path
  end

end
