class AthletesController < ApplicationController
  respond_to :json

  def index
    @athletes = athletes_service.all
    render json: @athletes
  end

  def create
    result = athletes_service.create(params[:athlete])

    if result.success?
      render json: result.entity, status: :created
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  def update
    result = athletes_service.update(params[:id], params[:athlete])

    if result.success?
      render json: result.entity, status: :accepted
    else
      render json: { errors: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def athletes_service
    @athletes_service ||= AthletesService.new
  end
end
