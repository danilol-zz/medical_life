class NotepadsController < ApplicationController
  before_action :set_notepad, only: [:show, :edit, :update, :destroy]

  # GET /notepads
  # GET /notepads.json
  def index
    @notepads = Notepad.all
  end

  # GET /notepads/1
  # GET /notepads/1.json
  def show
  end

  # GET /notepads/new
  def new
    @notepad = Notepad.new
  end

  # GET /notepads/1/edit
  def edit
  end

  # POST /notepads
  # POST /notepads.json
  def create
    @notepad = Notepad.new(notepad_params)

    respond_to do |format|
      if @notepad.save
        format.html { redirect_to @notepad, notice: 'Notepad was successfully created.' }
        format.json { render :show, status: :created, location: @notepad }
      else
        format.html { render :new }
        format.json { render json: @notepad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notepads/1
  # PATCH/PUT /notepads/1.json
  def update
    respond_to do |format|
      if @notepad.update(notepad_params)
        format.html { redirect_to @notepad, notice: 'Notepad was successfully updated.' }
        format.json { render :show, status: :ok, location: @notepad }
      else
        format.html { render :edit }
        format.json { render json: @notepad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notepads/1
  # DELETE /notepads/1.json
  def destroy
    @notepad.destroy
    respond_to do |format|
      format.html { redirect_to notepads_url, notice: 'Notepad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notepad
      @notepad = Notepad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notepad_params
      params.require(:notepad).permit(:name, :content_data, :user_id)
    end
end
