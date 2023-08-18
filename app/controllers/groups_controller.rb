class GroupsController < ApplicationController
    before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.where(author_id: current_user.id).order(created_at: :desc) || []
  end

  def show
    @group = Group.includes(:entities).find(params[:id])
    @entities = @group.entities.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.author = current_user

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_groups_path(current_user), notice: 'Category was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to user_groups_path, notice: 'Category was successfully deleted.'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon).merge(author_id: current_user.id)
  end
end
