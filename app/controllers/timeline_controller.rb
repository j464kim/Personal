 class TimelineController < ApplicationController
   before_action :authenticate_user!, except: [:show, :view_post] # requires login to write posts or comments

   def index
     @posts = Post.all.reverse # the most recent post on top
   end

   def show
     @posts = Post.all.order("updated_at DESC") # another way to list them in descending order
   end

   def new
     @post = Post.new
   end

   def write
     # save text through 'content' params and redirect back to the timeline page
     # current_user : user that is currently signed in to wrtie

    # before : Post.create(user_id: current_user.id, content: params[:post_content])
    @post = Post.new(content: params[:post_content], title: params[:post_title])
    @post.user = current_user
    if @post.save
    redirect_to '/timeline/show'
     end
   end

   def comment
    #  Creating comments accepts two parameters: post_id & comment_content
   # before: Comment.create(user_id: current_user.id, post_id: params[:post_id], msg: params[:comment_content])
   @post = Post.find(params[:post_id])
   @comment = Comment.new(post_id: params[:post_id],
                          msg: params[:comment_content])
   @comment.user = current_user
   if @comment.save
     redirect_to :back
   end
   end

   def edit_post
    #  find a post of the corresponding id and store it into an instance variable
    # takes :post_id parameters from index page and store it into @post to be used in edit_post page
    # this def behaves like a bridge


    #  if current_user.id == params[:user_id]
    #    @post = Post.find(params[:post_id])
    #  else
    #    puts "You cannot edit this post!"
    #  end

    # authenticate the post writer
    @post = Post.find(params[:post_id])
    if current_user == Post.find(params[:post_id]).user
       @post = Post.find(params[:post_id])
     else
       flash[:notice] = "You cannot edit this!"
       render :view_post
     end
   end

   def view_post
     @post = Post.find(params[:post_id])
   end

   def edit_comment
     # authenticate the comment writer
     if current_user == Comment.find(params[:comment_id]).user
       @comment = Comment.find(params[:comment_id])
     else
       flash[:notice] = "You cannot edit this!"
       redirect_to :back
     end
   end

   def update_post
     post_to_be_updated = Post.find(params[:post_id])
     post_to_be_updated.title = params[:post_title]
     post_to_be_updated.content = params[:post_content]
     # save the change in the database
     post_to_be_updated.save
     redirect_to :back
   end

   def update_comment
     comment_to_be_updated = Comment.find(params[:comment_id])
     comment_to_be_updated.msg = params[:comment_content]
     comment_to_be_updated.save
     redirect_to '/timeline/show'
    #  render "/view_post?post_id=<%=@post.id%>"
   end

   def destroy
     @post = Post.find(params[:post_id])
     # authenticate the post writer
     if current_user == Post.find(params[:post_id]).user
      # delets all the comments that belong to post_to_be_destroyed
       post_to_be_destroyed = Post.find(params[:post_id])

       post_to_be_destroyed.comments.each do |comment|
         comment_belonging = Comment.find(comment.id)
         comment_belonging.destroy
       end
       post_to_be_destroyed.destroy
       redirect_to '/timeline/show'
     else
       flash[:notice] = "You cannot destroy this!"
       render :view_post
     end
   end

   def destroy_comment
     # authenticate the comment writer
     if current_user == Comment.find(params[:comment_id]).user
       comment_to_be_destroyed = Comment.find(params[:comment_id])
       comment_to_be_destroyed.destroy
       redirect_to :back
     else
       flash[:notice] = "You cannot destroy this!"
       redirect_to :back
     end
   end

end # need this
