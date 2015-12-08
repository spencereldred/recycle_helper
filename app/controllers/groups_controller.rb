class GroupsController < ApplicationController
  before_filter :authorize
  before_filter :authorize_admin

  def index
    if current_user.function == 'super_admin'
      groups = Group.all
    else
      groups = Group.where(id: @current_profile.group_id)
    end
    groups.each do |group|
      group[:member_count] = group.users.length
    end
    respond_to do |format|
      format.html
      format.json { render :json => groups }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.json { render :json => Group.new }
    end
  end

  def create
    group = Group.create(params[:group])
    respond_to do |format|
      format.html
      format.json { render :json => group }
    end
  end

  def update
    group = Group.find(params[:id])
    changes = {
      name:         params[:name],
      url:          params[:url],
      description:  params[:description],
      promo_code:   params[:promo_code]
    }
    group.update_attributes(changes)
    respond_to do |format|
      format.html
      format.json { render :json => trans }
    end
  end

end
