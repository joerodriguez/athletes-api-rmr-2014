class ActivitiesController < ApplicationController
  respond_to :json

  def index
    @activities = activities_service.find_all_for_athlete (params[:athlete_id])
    render json: @activities
  end

  def create
    result = activities_service.create(params[:activity])

    if result.success?
      render json: result.entity, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def update
    result = activities_service.update(params[:id], params[:activity])

    if result.success?
      render json: result.entity, status: :accepted
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    result = activities_service.delete(params[:id])

    if result.success?
      render nothing: true, status: :ok
    else
      render json: { errors: result.errors }, status: :bad_request
    end
  end

  private

  def activities_service
    @activities_service ||= ActivitiesService.new
  end
end
