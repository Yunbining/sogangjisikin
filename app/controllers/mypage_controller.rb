class MypageController < ApplicationController
    def mypage_index
        @user = User.find(current_user.id)
        @posts = Post.where(user_id: @user.id)
    end
end
