class FavoritesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    
    authorize! :create, Favorite, message: "You cannot do that"

     if favorite.save
       # Add code to generate a success flash and redirect to @post
       # Remember the path shortcut: [@post.topic, @post]
     else
       # Add code to generate a failure flash and redirect to @post
     end
end

def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @favorite = current_user.favorites.find(params[:id])

    authorize! :destroy, @favorite, message: "You cannot do that."

    if @favorite.destroy
      flash[:notice] = "Removed favorite."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to [@topic, @post]
    end
  end
end
