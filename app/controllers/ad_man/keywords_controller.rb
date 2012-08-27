class AdMan::KeywordsController < ApplicationController
  
  # GET /keywords
  # GET /keywords.json
  def index
    @keywords = AdMan::Keyword.all
    respond_to do |format|
      format.html
      format.json { render json: @advertisements }
    end
  end
  
  # GET /keywords/1
  # GET /keywords/1.json
  def show
    @keyword = AdMan::Keyword.find(params[:id])
    @advertisements = AdMan::Advertisement.find_all_by_keyword_id(params[:id])
    @keywords = AdMan::Keyword.all
  end
  
  # GET /keywords/new
  # GET /keywords/new.json
  def new
    @keyword = AdMan::Keyword.new
    respond_to do |format|
      format.html
      format.json { render json: @keyword }
    end
  end
  
   # GET /keywords/1/edit
  def edit
    @keyword = AdMan::Keyword.find(params[:id])
  end
  
  # POST /keywords
  # POST /keywords.json
  def create 
    @keyword = AdMan::Keyword.new(params[:keyword])
    respond_to do |format|
      if @keyword.save
        format.html { redirect_to advertisements_path, notice: "Keyword successfully created."}
        format.json { render json: @keyword, status: :created, location: @keyword }
      else
        format.html { render action: "new"}
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end        
  end
  
  # PUT /keywords/1
  # PUT /keywords/1.json
  def update 
    @keyword = AdMan::Keyword.find(params[:id])
    respond_to do |format|
      if @keyword.update_attributes(params[:keyword])
        format.html { redirect_to advertisements_path, notice: "Keyword successfully updated."}
        format.json { head :no_content }
      else 
        format.html { render action: "edit"}
        format.json { render json: @keyword.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /keywords/1
  # DELETE /keywords/1.json
  def destroy 
    @keyword = AdMan::Keyword.find(params[:id])
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_path }
      format.json { head :no_content }
    end
  end

end
