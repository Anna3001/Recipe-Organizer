class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  skip_before_action :set_recipe, only: [:public]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
    load_authors_for_recipes
  end

  def public
    @recipes = Recipe.public_recipes
    load_authors_for_recipes
  end

  def publicRecipe
    @recipe = Recipe.find(params[:id])
    load_author_for_recipe if @recipe.present?
  end  

  # GET /recipes/1 or /recipes/1.json
  def show
    if @recipe.nil?
      redirect_to public_recipes_path, alert: 'Recipe not found'
    end

    load_author_for_recipe if @recipe.present?
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.user_id = current_user.id
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      if params[:id] == "public"
        @recipes = nil
      else  
        @recipe = Recipe.find(params[:id])
      end  
    end

    # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :instructions, :public, :category_id, :user_id)
  end

  def load_authors_for_recipes
    @recipe_authors = User.where(id: @recipes.pluck(:user_id)).index_by(&:id)
  end

  def load_author_for_recipe
    @recipe_author = User.find_by(id: @recipe.user_id)
  end
end
