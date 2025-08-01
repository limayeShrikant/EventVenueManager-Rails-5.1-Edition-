class VenuesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_venue, only: %i[ show edit update destroy ]

  # GET /venues or /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1 or /venues/1.json
  def show

  end

  # GET /venues/new
  def new
    @venue = Venue.new
    authorize @venue
  end

  # GET /venues/1/edit
  def edit
    authorize @venue
  end

  # POST /venues or /venues.json
  def create
    @venue = current_user.venues.build(venue_params)
    authorize @venue

    respond_to do |format|
      if @venue.save
        format.html { redirect_to venue_url(@venue), notice: "Venue was successfully created." }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1 or /venues/1.json
  def update
    authorize @venue
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to venue_url(@venue), notice: "Venue was successfully updated." }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1 or /venues/1.json
  def destroy
    authorize @venue
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to venues_url, notice: "Venue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venue_params
      params.require(:venue).permit(:name, :address, :capacity, :user_id)
    end
end
