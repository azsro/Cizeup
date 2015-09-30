class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def new
    @micropost = current_user.microposts.build if logged_in?
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
  end
  
    private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
