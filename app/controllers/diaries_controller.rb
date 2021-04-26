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
      @diary = Diary.new(diary_params)
        format.json { render :show, status: :created, location: @diary}
      respond_to do |format|
        if @diary.save
          format.html { redirect_to @diary, notice: 'Diary was successfully created_at'}
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
      respond_to do |format|
      if @diary.update(diary_params)  
          format.html { redirect_to @diary, notice: 'Diary was successfully updated'}
          format.json { render :show, status: :ok, location: @diary }
        else
          format.html { render :edit }
          format.json { render json: @diary.error, status: :unprocessable_entity }
        end
      end
  end

  def show
    
  end

  def destroy
    @diary.destroy
    redirect_to diaries_path
  
  end

  private
  #User collbacks shere common setup or constraints between actions
  def set_diary
    @diary = Diary.find(params[:id])
  end
  def diary_params
    params.require(:diary).permit(:title, :body)
  end 
end
