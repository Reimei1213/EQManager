class HomeController < ApplicationController

    before_action :logged_in_user, only:[:edit, :update]

    def index

        if params[:group_id]
            $groupId = params[:group_id]
        end

        if logged_in?
            $Group_User = GroupUser.where(user_id: current_user.id).where(group_id: $groupId)
        end
        # logger.debug("################################")
        # logger.debug(param)
    end

    def account

        if ! logged_in?
            render ("home/_not_logged_in")
        elsif ! GroupUser.exists?(user_id: current_user)
            render("home/group_add")
        else
            @gu = $Group_User[0]
        end
    end

    def add
        if ! logged_in?
            render ("home/_not_logged_in")
        elsif ! GroupUser.exists?(user_id: current_user)
            render("home/group_add")
        end
    end


end
