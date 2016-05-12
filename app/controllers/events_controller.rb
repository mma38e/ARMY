class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json

  def index
    @club = Club.find(params[:id])
    @events = Event.where(club_id: @club.id)

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @club = Club.find(@event.club_id)
    @attendees = Attendee.where(event_id: @event.id, attending: true)
    @response = Attendee.where(event_id: @event.id, user_id: current_user.id).first
    @attendees_count = @attendees.count
  end

  # GET /events/new
  def new
    @club = Club.find(params[:id])
    @event = @club.events.build

    # use flash to temporarily store club_id so it can be accessed in the create action
    flash[:club_id] = @club.id
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    
    @club = Club.find(flash[:club_id])
    @event = @club.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to controller: "events", action: "index", id: @club.id, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    club_id = @event.club_id
    @event.destroy
    respond_to do |format|
      format.html { redirect_to controller: "events", action: "index", id: club_id, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:eventName, :eventLocation, :eventDate, :eventTime, :eventInfo)
    end
end
