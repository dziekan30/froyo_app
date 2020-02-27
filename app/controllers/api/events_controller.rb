class Api::EventsController < ApplicationController
  before_action :authenticate_user
  
  def index
    
    @events = current_user.events
    @events = @events.order(:start_time)
    render 'index.json.jb'

  end

  def create
    @event = Event.new(
                        name: params[:name],
                        location: params[:location],
                        description: params[:description],
                        start_time: params[:start_time],
                        end_time: params[:end_time],
                        buffer: params[:buffer],
                        user_id: current_user.id
                      )
    @event.buffer_mod
    @event.unique_date_time_check
    if @event.save
      render 'show.json.jb'
    else
      render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @event = Event.find(params[:id])

    @event.name = params[:name] || @event.name
    @event.location = params[:location] || @event.location
    @event.description = params[:description] || @event.description
    @event.start_time = params[:start_time] || @event.start_time
    @event.end_time = params[:end_time] || @event.end_time
    @event.buffer = params[:buffer] || @event.buffer

    @event.buffer_mod
    @event.unique_date_time_check
    if @event.save
      render 'show.json.jb'
    else
      render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: {message: "It gone"}
  end

end
