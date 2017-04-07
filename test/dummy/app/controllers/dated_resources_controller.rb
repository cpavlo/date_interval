class DatedResourcesController < ApplicationController
  before_action :set_dated_resource, only: [:show, :edit, :update, :destroy]

  # GET /dated_resources
  def index
    @dated_resources = DatedResource.by_date_interval(params)
  end

  # GET /dated_resources/1
  def show
  end

  # GET /dated_resources/new
  def new
    @dated_resource = DatedResource.new
  end

  # GET /dated_resources/1/edit
  def edit
  end

  # POST /dated_resources
  def create
    @dated_resource = DatedResource.new(dated_resource_params)

    if @dated_resource.save
      redirect_to @dated_resource, notice: 'Dated resource was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /dated_resources/1
  def update
    if @dated_resource.update(dated_resource_params)
      redirect_to @dated_resource, notice: 'Dated resource was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /dated_resources/1
  def destroy
    @dated_resource.destroy
    redirect_to dated_resources_url, notice: 'Dated resource was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dated_resource
    @dated_resource = DatedResource.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def dated_resource_params
    params.require(:dated_resource).permit(:date, :name)
  end
end
