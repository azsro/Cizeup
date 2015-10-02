class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def new
    @micropost = current_user.microposts.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
      flash[:warning] = "An error occured. Post cannot be blank or longer than 200 characters"
      redirect_to(:back)
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end
  
    private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
