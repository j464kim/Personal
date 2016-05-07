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
     Comment.create(post_id: params[:post_id], msg: params[:comment_content])
     redirect_to :timeline
   end
end
