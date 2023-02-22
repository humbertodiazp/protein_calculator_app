class CalculatorsController < ApplicationController
  before_action :set_calculator, only: %i[ show edit update destroy ]

  # GET /calculators or /calculators.json
  def index
    @calculators = Calculator.all
  end

  # GET /calculators/1 or /calculators/1.json
  def show
  end

  # GET /calculators/new
  def new
    @calculator = Calculator.new
  end

  # GET /calculators/1/edit
  def edit
  end

  #calculate difference of body and goal weights 
  def result 

    if @calculator.goal_weight > @calculator.body_weight 
       x = @calculator.body_weight - @calculator.goal_weight 
    else 
      x = @calculator.goal_weight - @calculator.body_weight 
    end 

   result = x - @calculator.protein 

   return result

  end

  helper_method :return_result 

  



  # POST /calculators or /calculators.json
  def create
    @calculator = Calculator.new(calculator_params)

    respond_to do |format|
      if @calculator.save
        format.html { redirect_to calculator_url(@calculator), notice: "Calculation succesfully run." }
        format.json { render :show, status: :created, location: @calculator }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @calculator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculators/1 or /calculators/1.json
  def update
    respond_to do |format|
      if @calculator.update(calculator_params)
        format.html { redirect_to calculator_url(@calculator), notice: "Calculator was successfully updated." }
        format.json { render :show, status: :ok, location: @calculator }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @calculator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculators/1 or /calculators/1.json
  def destroy
    @calculator.destroy

    respond_to do |format|
      format.html { redirect_to calculators_url, notice: "Calculation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculator
      @calculator = Calculator.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calculator_params
      params.require(:calculator).permit(:body_weight, :goal_weight, :protein)
    end
end
