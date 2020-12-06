class ApplicationController < ActionController::Base
    include SessionsHelper

    # @Group_user = GroupUser.all

    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
        unless logged_in?
            redirect_to login_url
        end
    end
end
