class BorrowsController < ApplicationController
  before_action :set_borrow, only: [:show, :edit, :update, :destroy]

  # GET /borrows
  # GET /borrows.json
  def index
    @borrows = Borrow.all
  end

  # GET /borrows/1
  # GET /borrows/1.json
  def show
  end

  # GET /borrows/new
  def new
    @borrow = Borrow.new
  end

  # GET /borrows/1/edit
  def edit
  end

  # POST /borrows
  # POST /borrows.json
  def create

    # aaa = borrow_params
    # logger.debug("&&&&&&&&&&&&&&&&&&&&&&&&&&")
    # logger.debug(aaa)
    borrowParams = borrow_params

    if !borrowParams
      flash[:notice] = "現在借りられています"
      redirect_to ("/borrows/new") and return
    end

    @borrow = Borrow.new(borrowParams)
    # @borrow = Borrow.new(aaa)
    respond_to do |format|
      if @borrow.save
        # format.html { redirect_to @borrow, notice: 'Borrow was successfully created.' }
        # format.json { render :show, status: :created, location: @borrow }
        redirect_to "/add"
      else
        format.html { render :new }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrows/1
  # PATCH/PUT /borrows/1.json
  def update
    respond_to do |format|
      if @borrow.update(borrow_params)
        format.html { redirect_to @borrow, notice: 'Borrow was successfully updated.' }
        format.json { render :show, status: :ok, location: @borrow }
      else
        format.html { render :edit }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrows/1
  # DELETE /borrows/1.json
  def destroy
    @borrow.destroy
    respond_to do |format|
      format.html { redirect_to borrows_url, notice: 'Borrow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow
      @borrow = Borrow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def borrow_params
      equips = Equip.where(name: params[:borrow][:name])
      logger.debug("########################")
      logger.debug(equips)
      # params[:borrow].delete("name")

      for equip in equips do
        if !equip.state
          equip.update(state: true)
          return params.require(:borrow).permit().merge(equip_id: equip.id, group_id: $Group_User[0].group.id, group_user_id: $Group_User[0].id)
        end
      end
      # params.require(:borrow).permit(:return_day).merge(equip_id: equips[0].id, group_id: $Group_User[0].group.id, group_user_id: $Group_User[0].id)
      return nil
    end
end
