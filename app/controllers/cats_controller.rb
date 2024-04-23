class CatsController < ApplicationController
  before_action :set_cat, only: %i[ show edit update destroy ]

  def index
    @search = Cat.ransack(params[:q])
    @search.sorts = 'id desc' if @search.sorts.empty?
    @cats = @search.result.page(params[:page])
  end

  # GET /cats/1
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      flash.now.notice = "ねこを登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @cat.update(cat_params)
      flash.now.notice = "ねこを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy!
    flash.now.notice = "ねこを削除しました。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cat_params
      params.require(:cat).permit(:name, :age)
    end
end
