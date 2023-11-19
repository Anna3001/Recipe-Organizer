class DinnersController < ApplicationController
  before_action :set_dinner, only: %i[ show edit update destroy ]

  def new
    @dinner = Dinner.new
    @recipes = Recipe.all
  end

  # GET /dinners or /dinners.json
  def index
    @dinners = Dinner.all
  end

  def add_recipe_to_dinner
    @dinner = Dinner.find(params[:id])
    @recipes = Recipe.all
  end

  # GET /dinners/1 or /dinners/1.json
  def show
  end

  # GET /dinners/new
  #def new
  #  @dinner = Dinner.new
  #end

  def new
    @dinner = Dinner.new
    @recipes = Recipe.all
  end

  # GET /dinners/1/edit
  def edit
    @recipes = Recipe.all
  end

  # PATCH/PUT /dinners/1 or /dinners/1.json
  def update
    respond_to do |format|
      if @dinner.update(dinner_params)
        format.html { redirect_to dinner_url(@dinner), notice: "Dinner was successfully updated." }
        format.json { render :show, status: :ok, location: @dinner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinners/1 or /dinners/1.json
  def destroy
    @dinner.recipe_dinners.destroy_all

    @dinner.destroy

    respond_to do |format|
      format.html { redirect_to dinners_url, notice: "Dinner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # POST /dinners or /dinners.json
  def create
    @dinner = Dinner.new(dinner_params)

    respond_to do |format|
      if @dinner.save
        #create_recipe_dinners
        format.html { redirect_to @dinner, notice: "Dinner was successfully created." }
        format.json { render :show, status: :created, location: @dinner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dinner.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_recipe_dinners
    @dinner = Dinner.find(params[:id])

    # Use the selected recipe_ids to create RecipeDinner records
    recipe_id = params[:dinner][:recipe_ids].first
    if recipe_id.present?
      @dinner.recipe_dinners.create(recipe_id: recipe_id)
    end

    redirect_to dinner_path(@dinner), notice: 'Recipes added to the dinner successfully.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dinner
    @dinner = Dinner.find(params[:id])
  end

  def dinner_params
    params.require(:dinner).permit(:name, :recipes) # Permit an array of recipe_ids
  end

end