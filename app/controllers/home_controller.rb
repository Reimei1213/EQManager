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
        # # logger.debug($Group_User[0].group.id)
        # logger.debug($groupId)
        group_borrows = Borrow.where(group_id: $groupId)

        @borrow = []
        for group_borrow in group_borrows do
            if !group_borrow.return_day
                @borrow.push(group_borrow)
            end
        end

        # @equips = Equip.where(group_id: $groupId).where(state: true)
        # logger.debug("$$$$$$$$$$$$$$$$$$$$$$")
        # logger.debug(@borrow)

    end

    def account

        if ! logged_in?
            render ("home/_not_logged_in")
        elsif ! GroupUser.exists?(user_id: current_user)
            render("home/group_add")
        else
            @gu = $Group_User[0]
            user_borrows = Borrow.where(group_user_id: @gu.id)

            @borrow = []
            for user_borrow in user_borrows do
                if !user_borrow.return_day
                    @borrow.push(user_borrow)
                end
            end

            if params[:borrow_id]
                borrow = Borrow.where(id: params[:borrow_id])
                borrow[0].equip.update(state: false)
                borrow.update(return_day: Time.now)
                redirect_to "/account"
            end
        end
    end

    def add
        if ! logged_in?
            render ("home/_not_logged_in")
        elsif ! GroupUser.exists?(user_id: current_user)
            render("home/group_add")
        end
    end

    def equip_list

        if ! logged_in?
            render ("home/_not_logged_in")
        elsif ! GroupUser.exists?(user_id: current_user)
            render("home/group_add")
        else
            @gu = $Group_User[0]
            @equip = Equip.where(group_id: $groupId)
        end
    end
end
