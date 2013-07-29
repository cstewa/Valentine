class UsersController < ApplicationController
  before_filter :require_login, :except => [:create, :new]

  def index
    if current_user
      if current_user.gender == ("M" || "m")
        gender = "F" || "f"
      else
        gender = "M" || "m"
      end
    end
    query = params[:query]
    if query.blank?
      @users = User.where(:gender => gender)
    else
      search = User.search { fulltext query }
      @users = search.results
    end
  end

  def find_picture
    user = User.find(params[:id])
    index = params[:index]
    index = index.to_i
    render json: user.photos[index].picture
  end

  def show
    @user = User.find(params[:id])
    @photo = Photo.new
  end

  def create

    @user = User.new(params[:user])

    if @user.save
      auto_login(@user)
      if params[:stripeToken] != nil
          customer = Stripe::Customer.create(
            :email => @user.email,
            :card  => params[:stripeToken],
            :plan => "paid"
          )
      end
      redirect_to user_url(@user)
    else
      render :new
    end

  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.photos.each do |photo|
          photo.update_attributes(:is_profile => false)
        end
        @user.photos.find(params[:photo_id]).update_attributes(:is_profile => true)
        format.html { redirect_to @user, notice: 'Just saved your new profile :)' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
  end

  def match

  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end
end
