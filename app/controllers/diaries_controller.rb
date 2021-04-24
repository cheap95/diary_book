class DiariesController < ApplicationController
  before_action :set_diary, only: [:edit, :show, :destroy, :update]

  # GET /diareis
  # GET /diareis.json
  def index 
    @diary = Diary.all.order("created_at DESC")
  end

  def new
    @diary = Diary.new
  end

  def create
    #binding.pry
    respond_to do |format|
      @diary = Diary.new(diary_params)
      if @diary.save
        format.html { redirect_to @diary, notice: 'Dairy was successfully created_at'}
        format.json { render :show, status: :created, location: @diary}
      else
        format.html ( render :new)
        format.json { render json: @diary.error, status: :unprocessable_entity}
      end
   end
  end

  def edit
    
  end
  def update
    
  end

  def show
    
  end

  def destroy
    
  
  end

  private
  #User collbacks shere common setup or constraints between actions
  def set_diary
    @diary = Diary.find(params[:id])
  end
  def diary_params
    #params.permit(:title, :body)
    params.require(:diary).permit(:title, :body)
  end 
end
