require_dependency "ad_man/application_controller"

module AdMan
  class AdvertisementsController < ApplicationController
    # GET /advertisements
    # GET /advertisements.json
    def index
      @advertisements = Advertisement.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @advertisements }
      end
    end
  
    # GET /advertisements/1
    # GET /advertisements/1.json
    def show
      @advertisement = Advertisement.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @advertisement }
      end
    end
  
    # GET /advertisements/new
    # GET /advertisements/new.json
    def new
      @advertisement = Advertisement.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @advertisement }
      end
    end
  
    # GET /advertisements/1/edit
    def edit
      @advertisement = Advertisement.find(params[:id])
    end
  
    # POST /advertisements
    # POST /advertisements.json
    def create
      @advertisement = Advertisement.new(params[:advertisement])
  
      respond_to do |format|
        if @advertisement.save
          format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
          format.json { render json: @advertisement, status: :created, location: @advertisement }
        else
          format.html { render action: "new" }
          format.json { render json: @advertisement.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /advertisements/1
    # PUT /advertisements/1.json
    def update
      @advertisement = Advertisement.find(params[:id])
  
      respond_to do |format|
        if @advertisement.update_attributes(params[:advertisement])
          format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @advertisement.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /advertisements/1
    # DELETE /advertisements/1.json
    def destroy
      @advertisement = Advertisement.find(params[:id])
      @advertisement.destroy
  
      respond_to do |format|
        format.html { redirect_to advertisements_url }
        format.json { head :no_content }
      end
    end
  end
end
