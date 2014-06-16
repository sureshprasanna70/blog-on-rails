class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries
  # GET /galleries.json
  def index
    @title="GALLERY"
    meta("index","","")
    @galleries = Gallery.all
     @gallery_attachments=GalleryAttachment.all; 
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
     @gallery_attachments=@gallery.gallery_attachments.all;
  end

  # GET /galleries/new
  def new
    if user_signed_in?
      @gallery = Gallery.new
      @gallery_attachment = @gallery.gallery_attachments.build
  else
    redirect_to('/users/sign_in')
    end
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create
    if user_signed_in?
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        params[:gallery_attachments]['photos'].each do |a|
          @gallery_attachment = @gallery.gallery_attachments.create!(:photos => a, :gallery_id => @gallery.id)
       end
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to('/users/sign_in')
    end

  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    if user_signed_in?
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to('/users/sign_in')
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    if user_signed_in?
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  else
    redirect_to('/users/sign_in')
    end
  end
  def meta(fn_name,cust_title,cust_url)
    if fn_name=="index"
      puts "INDEX"

      $og_title="CEG SPARTANZ|GALLERY"
      $og_image="/assets/"
      $og_url="http://cegspartanz.in/galleries"
      $og_description="The official website of CEG-SPARTANZ"
    elsif fn_name=="show"
      $og_title=cust_title
      $og_image="/assets/"
      $og_url="http://www.cegspartanz.in/galleries/"
      $url=cust_url
      $og_description="The official website of CEG-SPARTANZ"
    end
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:caption)
    end
end
