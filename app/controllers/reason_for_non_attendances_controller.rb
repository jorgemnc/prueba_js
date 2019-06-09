class ReasonForNonAttendancesController < ApplicationController
  before_action :set_reason_for_non_attendance, only: [:show, :edit, :update, :destroy]

  # GET /reason_for_non_attendances
  # GET /reason_for_non_attendances.json
  def index
    @reason_for_non_attendances = ReasonForNonAttendance.all
  end

  # GET /reason_for_non_attendances/1
  # GET /reason_for_non_attendances/1.json
  def show
  end

  # GET /reason_for_non_attendances/new
  def new
    @reason_for_non_attendance = ReasonForNonAttendance.new
  end

  # GET /reason_for_non_attendances/1/edit
  def edit
  end

  # POST /reason_for_non_attendances
  # POST /reason_for_non_attendances.json
  def create
    @reason_for_non_attendance = ReasonForNonAttendance.new(reason_for_non_attendance_params)

    respond_to do |format|
      if @reason_for_non_attendance.save
        format.html { redirect_to @reason_for_non_attendance, notice: 'Reason for non attendance was successfully created.' }
        format.json { render :show, status: :created, location: @reason_for_non_attendance }
      else
        format.html { render :new }
        format.json { render json: @reason_for_non_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reason_for_non_attendances/1
  # PATCH/PUT /reason_for_non_attendances/1.json
  def update
    respond_to do |format|
      if @reason_for_non_attendance.update(reason_for_non_attendance_params)
        format.html { redirect_to @reason_for_non_attendance, notice: 'Reason for non attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @reason_for_non_attendance }
      else
        format.html { render :edit }
        format.json { render json: @reason_for_non_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reason_for_non_attendances/1
  # DELETE /reason_for_non_attendances/1.json
  def destroy
    @reason_for_non_attendance.destroy
    respond_to do |format|
      format.html { redirect_to reason_for_non_attendances_url, notice: 'Reason for non attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reason_for_non_attendance
      @reason_for_non_attendance = ReasonForNonAttendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reason_for_non_attendance_params
      params.require(:reason_for_non_attendance).permit(:motivo)
    end
end
