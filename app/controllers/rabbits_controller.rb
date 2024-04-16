class RabbitsController < ApplicationController
  before_action :set_rabbit, only: %i[ show edit update destroy ]

  # GET /rabbits
  def index
    @rabbits = Rabbit.all
  end

  # GET /rabbits/1
  def show
  end

  # GET /rabbits/new
  def new
    @rabbit = Rabbit.new
  end

  # GET /rabbits/1/edit
  def edit
  end

  # POST /rabbits
  def create
    @rabbit = Rabbit.new(rabbit_params)

    if @rabbit.save
      redirect_to @rabbit, notice: "Rabbit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rabbits/1
  def update
    if @rabbit.update(rabbit_params)
      redirect_to @rabbit, notice: "Rabbit was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /rabbits/1
  def destroy
    @rabbit.destroy!
    redirect_to rabbits_url, notice: "Rabbit was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rabbit
      @rabbit = Rabbit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rabbit_params
      params.require(:rabbit).permit(:name, :age)
    end
end
