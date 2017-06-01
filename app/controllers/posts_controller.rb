class PostsController < ApplicationController

    #메인페이지    
    def index
        @posts = Post.order('created_at DESC')
        
    end
    
    #게시글 작성, 수정, 삭제
    def new
        @post = Post.new
    end
    
    def create
        @post=Post.new
        @post.title=params[:post][:title]
        @post.content=params[:post][:content]
        @post.image_url=params[:post][:image]
        @post.save
        
        redirect_to '/show'
    end
    
    def destroy
        @destroy_post=Post.find(params[:post_id])
        @destroy_post.destroy
        
        redirect_to '/show'
    end
    
    def edit
        @edit_post = Post.find(params[:post_id])
        
    end
    
    def upload
        @upload_post = Post.find(params[:post_id])
        @upload_post.title = params[:post][:title]
        @upload_post.content = params[:post][:content]
        @upload_post.save
        
        redirect_to '/show'
    end


    #게시글 목록, 게시글 보기
    def show
        @subgroups = Subgroup.all
        if params[:search]
        @subgroups = Subgroup.search(params[:search]).order("created_at DESC")
        else
         @subgroups = Subgroup.all.order('created_at DESC')
        end
    
        @posts=Post.all
    end
    
    def show_prof
    end

    def show_post
        @show_post=Post.find(params[:post_id])
    end
    
    #댓글 쓰기, 댓글 수정, 댓글 삭제 
    
    def cmtcreate
        @comment=Reply.new
        @comment.content=params[:content]
        @comment.post_id=params[:post_id]
        #@comment.is_re_reply=params[:is_re_reply]
        @comment.save
        
        redirect_to :back
    end
    
    def cmtdestroy
        @destroy_cmt=Post.find(params[:post_id]).replies.find(params[:reply_id])
        @destroy_cmt.destroy
        
        redirect_to :back
    end
    
    def cmtedit
        @edit_cmt= Post.find(params[:post_id]).replies.find(params[:reply_id])
        @post = Post.find(params[:post_id])
        
    end
    
    def cmtupload
        @upload_cmt = Post.find(params[:post_id]).replies.find(params[:reply_id])
        @upload_cmt.content = params[:content]
        @post = Post.find(params[:post_id])
        @upload_cmt.save
        
        redirect_to posts_showpost_path(@post)
       
    end
    

    #대댓글 쓰기, 대댓글 수정, 대댓글 삭제 
    
    def recreate
        @recomment=Rereply.new
        @recomment.content=params[:content]
        @recomment.reply_id=params[:reply_id]
        @recomment.save
        redirect_to :back
    end
    
    def redestroy
        @destroy_recmt = Reply.find(params[:reply_id]).rereplies.find(params[:rereply_id])
        @destroy_recmt.destroy
        
        redirect_to :back
    end

    def reedit
        @edit_recmt=Reply.find(params[:reply_id]).rereplies.find(params[:rereply_id])
        @comment = Reply.find(params[:reply_id])
    end
 
    def reupload
        @edit_upload=Reply.find(params[:reply_id]).rereplies.find(params[:rereply_id])
        @edit_upload.content=params[:content]
        @post = Reply.find(params[:reply_id]).post.id
        @comment = Reply.find(params[:reply_id])
        @edit_upload.save
        
        redirect_to posts_showpost_path(@post)
    end
end
