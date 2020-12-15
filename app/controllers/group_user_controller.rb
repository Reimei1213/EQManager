class GroupUserController < ApplicationController

    def new
        @groupUser = GroupUser.new
    end

    def create

        group_id = group_user_params

        if !group_id
            flash[:notice] = "入力されたグループは存在しません"
            redirect_to("/group_user/new") and return
        end
        @groupUser = GroupUser.new(user_id: current_user.id, group_id: group_id)

        if @groupUser.save
            redirect_to "/account"
        else
            render :action => "new"
        end
    end

    def group_user_params
        logger.debug("!!!!!!!!!!!!!!!!!!!")
        logger.debug(params[:name])
        name = params[:name]
        group = Group.where(name: name)
        if group
            id = group[0].id
            # return params.require(:group_user).merge(user_id: current_user.id, group_id: id)
            return id
        end
        return nil
    end

end
