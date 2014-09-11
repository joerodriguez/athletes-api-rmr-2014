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
      render json: { errors: @transaction.errors }, status: :unprocessable_entity
    end
  end

  def update
    @transaction = athletes_service.update(params[:id], params[:athlete])

    if @transaction.success?
      render json: @transaction.entity, status: :accepted
    else
      render json: { errors: @transaction.errors }, status: :unprocessable_entity
    end
  end

  private

  def athletes_service
    @athletes_service ||= AthletesService.new
  end
end
