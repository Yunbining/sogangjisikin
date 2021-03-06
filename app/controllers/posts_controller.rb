class PostsController < ApplicationController

    #메인페이지    
    def index
        @posts = Post.order(created_at: :desc).limit(14)
        @rcmposts = Post.order(likecount: :desc).limit(14)
        
    end
    
    #게시글 작성, 수정, 삭제
    def new
        @post = Post.new
        @subjects = Subject.all
        
    
    end
    
    def create
      
        @subjects = Subject.all
        @post=Post.new
        @post.user_id = current_user.id
        @post.title=params[:post][:title]
        @post.content=params[:post][:content]
        @post.subject_id=params[:subject_id]
        @post.subject_subname=params[:subject_subname]
        @post.subject_professor=params[:subject_professor]
        @post.image_url=params[:post][:image_url]
        
        # @post.user_id = current_user.id
        @post.save
    
        
        redirect_to posts_showpost_path(@post)
     
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
        @subjects = Subject.all
        if params[:search]
        @subjects = Subject.search(params[:search]).order(created_at: :desc)
        else
         @subjects = Subject.all.order('created_at DESC')
        end
    
        @posts=Post.order(created_at: :desc)
    end
    
    def show_prof
    end

    def show_post
        @show_post=Post.find(params[:post_id])
        #@info=Subject.find(params[:subject_id])
        @likecount=Like.where(post_id: params[:post_id]).count
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
    
    #학과 과목 교수 카테고리
    def subject
        @subjects = Subject.all
        if params[:search]
        @subjects = Subject.search(params[:search]).order(created_at: :desc)
        else
        @subjects = Subject.all.order('created_at DESC')
        end
    
        @posts=Post.order(created_at: :desc)
       
    end
    
    def subject_show
        @subject = Subject.where(subname: params[:subname])
    end

    #좋아요
    def like
        @like = Like.new
        @like.post_id=params[:post_id]
        @like.user_id=params[:user_id]
        @like.save
        
        @postlike = Post.find(params[:post_id])
        @postlike.likecount += 1
        @postlike.save
        
        redirect_to :back
    end
end