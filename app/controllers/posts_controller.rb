class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @company = Company.includes(:posts).find(params[:company_id])
    @posts = @company.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @company = Company.includes(:posts).find(params[:company_id])
    @post = @company.posts.new
    @tags = Tag.all
  end

  # GET /posts/1/edit
  def edit
    @company = Company.includes(:posts).find(params[:company_id])
    @post = @company.posts.includes(:tags).find(params[:id])
    @tags = Tag.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @company = Company.includes(:posts).find(params[:company_id])
    @post = @company.posts.new(post_params)
    @tags = Tag.all

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@company, @post], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [@company, @post] }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @company = Company.includes(:posts).find(params[:company_id])
      @post = @company.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :company_id, :job_type, tag_ids: [])
    end
end
