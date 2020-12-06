class HomeController < ApplicationController

    before_action :logged_in_user, only:[:edit, :update]

    def index

    end

    def account
        if ! GroupUser.exists?(user_id: current_user)
            render("home/group_add")
        end
    end

    def add
    end


end
