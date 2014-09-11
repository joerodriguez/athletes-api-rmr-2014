class AthletesController < ApplicationController
  respond_to :json

  def index
    @athletes = athletes_service.all
    render json: @athletes
  end

  def create
    @transaction = athletes_service.create(params[:athlete])

    if @transaction.success?
      render json: @transaction.entity, status: :created
    else
      render json: { errors: @transaction.errors }, status: :bad_request
    end
  end

  private

  def athletes_service
    @athletes_service ||= AthletesService.new
  end
end
