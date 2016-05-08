 class TimelineController < ApplicationController

   def index
     @posts = Post.all.reverse # the most recent post on top
   end

   def write
     Post.create(content: params[:post_content])
     redirect_to :timeline
    # save text through 'content' params and redirect back to the timeline page
   end

   def comment
    #  Creating comments accepts two parameters: post_id & comment_content
     Comment.create(post_id: params[:post_id], msg: params[:comment_content])
     redirect_to :timeline
   end

   def destroy

    # delets all the comments that belong to post_to_be_destroyed
     post_to_be_destroyed = Post.find(params[:post_id])
     post_to_be_destroyed.comments.each do |comment|
     b = Comment.find(comment.id)
     b.destroy
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
