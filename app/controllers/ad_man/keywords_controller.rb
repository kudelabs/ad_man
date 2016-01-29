class AdMan::KeywordsController < AdMan::ApplicationController
  respond_to :html, :json 

  def index
    @keywords = AdMan::Keyword.all
    respond_with @keywords
  end
  
  def show
    @keyword = AdMan::Keyword.find(params[:id])
    @advertisements = AdMan::Advertisement.find_all_by_keyword_id(params[:id])
    @keywords = AdMan::Keyword.all
  end
  
  def new
    @keyword = AdMan::Keyword.new
    respond_with(@keyword)
  end
  
  def edit
    @keyword = AdMan::Keyword.find(params[:id])
  end
  
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
  
  def destroy 
    @keyword = AdMan::Keyword.find(params[:id])
    @keyword.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_path }
      format.json { head :no_content }
    end
  end

end
