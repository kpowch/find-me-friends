class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # TODO uncomment this if we make friendship pages
  # # redirect users who are not logged in
  # before_action :require_login

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  #
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)
    console.log(friendship_params)
    puts 'in friendships create'
    respond_to do |format|
      if @friendship.save
        @new_friend = User.where(id: :friend_id)
        UserMailer.welcome_email(@user, @new_friend).deliver_now
        format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        format.json { render :show, status: :created, location: @friendship }
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship = Friendship.find(params[:id])
    respond_to do |format|
      if @friendship.update(friendship_status: params[:friendship_status])
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Are we using this method?!
  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = User.includes(:interests)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def friendship_params
    puts params
    params.require(:friendship).permit(:user_id, :friend_id, :created, :destroy, :friendship_status, :id, :created_at, :updated_at)
  end


end
