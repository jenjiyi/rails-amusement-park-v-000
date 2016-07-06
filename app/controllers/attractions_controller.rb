class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    return redirect_to controller: 'attractions', action: 'new' unless @attraction.save
    session[:attraction_id] = @attraction.id
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
     @attraction = Attraction.find(params[:id])
      if @attraction.update(attraction_params)
         redirect_to @attraction, notice: 'Attraction was successfully updated.' 
      else
        redirect_to edit_attraction_path(@attraction) 
      end
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

end
