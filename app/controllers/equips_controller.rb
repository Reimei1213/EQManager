class EquipsController < ApplicationController
  before_action :set_equip, only: [:show, :edit, :update, :destroy]

  # GET /equips
  # GET /equips.json
  def index
    @equips = Equip.all
  end

  # GET /equips/1
  # GET /equips/1.json
  def show
  end

  # GET /equips/new
  def new
    @equip = Equip.new
  end

  # GET /equips/1/edit
  def edit
  end

  # POST /equips
  # POST /equips.json
  def create
    @equip = Equip.new(equip_params)

    respond_to do |format|
      if @equip.save
        # format.html { redirect_to @equip, notice: 'Equip was successfully created.' }
        # format.json { render :show, status: :created, location: @equip }
        redirect_to "/add"
      else
        format.html { render :new }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equips/1
  # PATCH/PUT /equips/1.json
  def update
    respond_to do |format|
      if @equip.update(equip_params)
        format.html { redirect_to @equip, notice: 'Equip was successfully updated.' }
        format.json { render :show, status: :ok, location: @equip }
      else
        format.html { render :edit }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equips/1
  # DELETE /equips/1.json
  def destroy
    @equip.destroy
    respond_to do |format|
      format.html { redirect_to equips_url, notice: 'Equip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equip
      @equip = Equip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def equip_params
      params.require(:equip).permit(:name, :classification_id).merge(state: false , group_id: $Group_User[0].group.id)
    end
end
