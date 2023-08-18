class EntitiesController < ApplicationController
    before_action :set_entity, only: %i[show edit update destroy]

    def index
      @entities = Entity.all
    end
  
    def show; end
  
    def new
      @entity = Entity.new
      @groups = Group.where(author_id: current_user.id) || []
      @group_id = params[:group_id].to_i
    end
  
    def edit; end
  
    def create
      group_ids = entity_params[:group_ids].reject(&:empty?).map(&:to_i)
      @entity = Entity.new(entity_params.except(:group_ids, :group_id))
  
      group_ids.each do |id|
        group = Group.find(id)
        group.entities << @entity
      end
  
      respond_to do |format|
        if @entity.save
          format.html do
            group_id = group_ids.first
            redirect_to user_group_path(current_user, group_id), notice: 'Transaction was successfully created.'
          end
          format.json { render :show, status: :created, location: @entity }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @entity.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @entity.update(entity_params)
          format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
          format.json { render :show, status: :ok, location: @entity }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @entity.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @entity.destroy
  
      respond_to do |format|
        format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def set_entity
      @entity = Entity.find(params[:id])
    end
  
    def entity_params
      params.require(:entity).permit(:name, :amount, :group_id, group_ids: []).merge(author_id: current_user.id)
    end
end
