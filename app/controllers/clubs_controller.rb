class ClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  
  # GET club members, their approved status, and the membership id
  def show
    @club_members = User.joins(:memberships).where(:memberships => {club_id: @club.id})
                    .select('users.*, memberships.approved, memberships.id as memberships_id')
  end

  # Queries all clubs that the current user belongs to and also all the clubs in the database
  def join
    @clubs = Club.all
    @user_clubs = Membership.where(user_id: current_user.id)
    if params[:search]
        @clubs = Club.search(params[:search]).order('name ASC')
    end
  end

  # Used for pulling all users so that they can be invited to join a club
  def invite
    @users = nil
    if params[:search]
      @users = User.where(email: params[:search])
    end
    @club_id = params[:club_id]
  end

  # GET /clubs/new
  def new
    @club = current_user.clubs_as_admin.build #Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # Creates a club record and also a membership record between the user and the club
  def create
    @club = current_user.clubs_as_admin.build(club_params) #Club.new(club_params)
    
    respond_to do |format|
      if @club.save
        # when a user creates a club, automatically create a club_user record in the memberships table
        @club_membership = Membership.new(user_id: current_user.id, club_id: @club.id, approved: true)
        if @club_membership.save
          format.html { redirect_to @club, notice: 'Club was successfully created.' }
          format.json { render :show, status: :created, location: @club }
        else
          format.html { render :new }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :description)
    end
end
