class CookbooksController < ApplicationController
  before_action :set_cookbook, only: [:show, :edit, :update, :destroy]

  # GET /cookbooks
  # GET /cookbooks.json
  def index
    @cookbooks = Cookbook.all
  end

  # GET /cookbooks/1
  # GET /cookbooks/1.json
  def show
  end

  # GET /cookbooks/new
  def new
    @cookbook = Cookbook.new
    @recipes = Ingredient.all.collect{|p| [p.name, p.id]}
  end

  # GET /cookbooks/1/edit
  def edit
    @recipes = Recipe.all.collect{|p| [p.name, p.id]}
  end

  # POST /cookbooks
  # POST /cookbooks.json
  def create
    @cookbook = Cookbook.new(cookbook_params)
    params[:cookbook][:recipes].each do |recipe_id|
      next if recipe_id.to_i == 0
      recipe = Recipe.find(recipe_id.to_i)
      @cookbook.recipes << recipe
    end

    respond_to do |format|
      if @cookbook.save
        format.html { redirect_to @cookbook, notice: 'Cookbook was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cookbook }
      else
        format.html { render action: 'new' }
        format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cookbooks/1
  # PATCH/PUT /cookbooks/1.json
  def update
    respond_to do |format|
      if @cookbook.update(cookbook_params)
        params[:cookbook][:recipes].each do |recipe_id|
          next if recipe_id.to_i == 0
          recipe = Recipe.find(recipe_id.to_i)
          @cookbook.recipes << recipe
      end
        format.html { redirect_to @cookbook, notice: 'Cookbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookbooks/1
  # DELETE /cookbooks/1.json
  def destroy
    @cookbook.destroy
    respond_to do |format|
      format.html { redirect_to cookbooks_url }
      format.json { head :no_content }
    end
  end

  def remove_recipe
    r = CookbookRecipe.find_by_cookbook_id_and_recipe_id(params[:id], params[:recipe_id])
    r.destroy
    redirect_to cookbook_path(params[:id])
  end

  def add_note
    r = CookbookRecipe.find_by_cookbook_id_and_recipe_id(params[:id], params[:recipe_id])
    r.notes = params[:cookbook_recipe][:notes]
    r.save!

    redirect_to cookbook_path(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cookbook_params
      params.require(:cookbook).permit(:name, :user_id, :recipes =>{})
    end
end
