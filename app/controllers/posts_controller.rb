class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search]).paginate(page: params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.view
    @replies = @post.replies.paginate(page: params[:page])
    @reply = Reply.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @replies = @post.replies.paginate(page: params[:page])
    @reply = Reply.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      @post.update_attribute(:reply_at, @post.created_at)
      @reply = @post.replies.build(user_id: current_user.id, content: @post.content) 
      @reply.save
      redirect_to @post
      flash.now[:success] = "Post success!"
    else
      render 'new'  
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update 
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content)
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
