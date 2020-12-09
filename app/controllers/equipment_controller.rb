class EquipmentController < ApplicationController
    def new
        @equip = Equipment.new
    end

    def create
        @equip = Equipment.new(equipment_params)
        # logger.debug(group_params)
        @equip.save!
    end

    # PATCH/PUT /groups/1
    # PATCH/PUT /groups/1.json
    def update
        params.require(:equipment).permit()
    end

    def equipment_params
        params.require(:equipment).permit(:name, classification_id).merge(state: true, group_id: $Group_User[0].group.id)
        #admin: current_user.id
    end
end
