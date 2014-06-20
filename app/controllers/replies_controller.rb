class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create]
  # GET /replies
  # GET /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    if @reply.save
      @post = @reply.post
      @post.reply_at = @reply.created_at
      @post.save
      redirect_to post_path(Post.find(reply_params[:post_id]))
      flash[:success] = "Post reply success!"
    else
      redirect_to post_path(Post.find(reply_params[:post_id]))
      flash[:error] = "Reply is too short!"
     end 
  end

  # PATCH/PUT /replies/1
  # PATCH/PUT /replies/1.json
  def update
      if @reply.update(reply_params)
        redirect_to edit_reply_path(@reply)
      else
        format.html { render action: 'edit' }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @post = @reply.post
    @reply.destroy
    redirect_to post_path(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:content, :post_id)
    end
  
    def signed_in_user
      unless signed_in?
        redirect_to signin_url, notice: "Please sign in."
      end
    end
end
