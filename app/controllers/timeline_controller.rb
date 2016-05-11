 class TimelineController < ApplicationController
   before_action :authenticate_user!, except: :index # requires login to write posts or comments

   def index
     @posts = Post.all.reverse # the most recent post on top
   end

   def write
     # save text through 'content' params and redirect back to the timeline page
     # current_user: user that is currently signed in to wrtie
     Post.create(user_id: current_user.id, content: params[:post_content])
     redirect_to :timeline
   end

   def comment
    #  Creating comments accepts two parameters: post_id & comment_content
     Comment.create(user_id: current_user.id, post_id: params[:post_id], msg: params[:comment_content])
     redirect_to :timeline
   end

   def edit_post
    #  find a post of the corresponding id and store it into an instance variable
    # takes :post_id parameters from index page and store it into @post to be used in edit_post page
    # this def behaves like a bridge
     @post = Post.find(params[:post_id])
   end

   def edit_comment
     @comment = Comment.find(params[:comment_id])
   end

   def update_post
     post_to_be_updated = Post.find(params[:post_id])
     post_to_be_updated.content = params[:post_content]
     # save the change in the database
     post_to_be_updated.save
     redirect_to :timeline
   end

   def update_comment
     comment_to_be_updated = Comment.find(params[:comment_id])
     comment_to_be_updated.msg = params[:comment_content]
     comment_to_be_updated.save
     redirect_to :timeline
   end

   def destroy
    # delets all the comments that belong to post_to_be_destroyed
     post_to_be_destroyed = Post.find(params[:post_id])
     post_to_be_destroyed.comments.each do |comment|
       comment_belonging = Comment.find(comment.id)
       comment_belonging.destroy
     end

     post_to_be_destroyed.destroy
     redirect_to :timeline
   end

   def destroy_comment
     comment_to_be_destroyed = Comment.find(params[:comment_id])
     comment_to_be_destroyed.destroy
     redirect_to :timeline
   end

end # need this
