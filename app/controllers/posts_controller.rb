class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  $og_title=""
  $og_image=""
  $og_url=""
  $url=""
  $og_description=""
  WillPaginate.per_page = 9
  # GET /posts
  # GET /posts.json
  def index
    if user_signed_in?
    @posts = Post.all.order('id DESC').paginate(:page => params[:page])
    else
    @posts = Post.where(:publish => true).order('id DESC').paginate(:page=>params[:page])
  end
    @title="BLOG"
    @post_attachments = PostAttachment.all
    meta("index","","")

 end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @title=@post.title
    @post_attachments = @post.post_attachments.all
    meta("show",@title,@post.id)
 end

  # GET /posts/new
  def new
   if user_signed_in? 
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  else
    redirect_to ('/users/sign_in')
  end

end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    
      begin
         if user_signed_in?
      @post = Post.new(post_params)

      respond_to do |format|
        if @post.save
          if params[:post_attachments]
            puts "Koi"
              params[:post_attachments]['avatar'].each do |a|
              @post_attachment = @post.post_attachments.create!(:avatar => a, :post_id => @post.id)
            end
          end
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { render action: 'new' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to ('/users/sign_in')
    end
      rescue Exception => e
          error_render_method("Invalid image type")
    
      end

  end
 def error_render_method(message)
    @message=message
    respond_to do |type|
      type.html { render :template => "exception.html"}
      type.all  { render :nothing => true, :status => 404 }
    end
    true
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if user_signed_in?
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    else
      redirect_to ('/users/sign_in')
    end
  end
  def meta(fn_name,cust_title,cust_url)
    if fn_name=="index"
      puts "INDEX"
      $og_title="STUDENTS FM|BLOG"
    elsif fn_name=="show"
      $og_title=cust_title
      $url=cust_url
    end
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :publish)
    end
  end
