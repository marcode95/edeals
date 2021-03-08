class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :require_login

  # GET /groups or /groups.json
  def index
    @groups = Group.all.order(name: :asc)
  end

  # GET /groups/1 or /groups/1.json
  def show
    @groupdeals = @group.deals
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    selected_id = params[:group][:other_transaction_ids]
    transaction = Transaction.find(selected_id)
    group = Group.find(params[:id])
    group.deals << transaction
    redirect_to group_path(group)
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :image)
  end
end
