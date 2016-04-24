class ClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @club_members = User.joins(:memberships).where(:memberships => {club_id: @club.id})
  end

  def join
    @clubs = Club.all
    @user_clubs = Membership.where(user_id: current_user.id)
  end

  def create_membership
    @membership = Membership.new(membership_params)
    
    respond_to do |format|
      if @membership.save
        format.html { redirect_to join_path, notice: 'Your membership request has been submitted' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /clubs/new
  def new
    @club = current_user.clubs_as_admin.build #Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = current_user.clubs_as_admin.build(club_params) #Club.new(club_params)
    
    respond_to do |format|
      if @club.save
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
