class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @friendship.save
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
    respond_to do |format|
      if @friendship.update(friendship_params)
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
 # given user, will return an ordered array (?confirm order?) of users with matched interests
  def friendlist(user)
    User.find_by_sql(
      "SELECT
        friend_interests_users.user_id as id,
        count(common_interests.id) as num_common_interests
      FROM
        users as me
        left join interests_users as my_interests_users on my_interests_users.user_id = me.id
        left join interests as common_interests on my_interests_users.interest_id = common_interests.id
        left join interests_users as friend_interests_users on common_interests.id = friend_interests_users.interest_id
      WHERE
        friend_interests_users.user_id <> #{user.id} and
        me.id = #{user.id}
      GROUP BY
        friend_interests_users.user_id
      ORDER BY
        num_common_interests desc;"
    )
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = User.includes(:interests)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
  end


end
