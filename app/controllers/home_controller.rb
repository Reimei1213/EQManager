class HomeController < ApplicationController

    before_action :logged_in_user, only:[:edit, :update, :destroy]

    def top
    end

    def account
    end

    def add
    end


end
