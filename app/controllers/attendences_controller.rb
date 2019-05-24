class AttendencesController < ApplicationController

def index
  @attendences = Attendence.all
end

def create
    @attendence = Attendence.new(attendence_params)

    respond_to do |format|
      if @attendence.save
        format.html { redirect_to @attendence, notice: 'Center was successfully created.' }
        format.json { render :show, status: :created, location: @attendence }
      else
        format.html { render :new }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1
  # PATCH/PUT /centers/1.json
  def update
    respond_to do |format|
      if @attendence.update(attendence_params)
        format.html { redirect_to @attendence, notice: 'Attendence was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendence }
      else
        format.html { render :edit }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  def generate_attendence
  	@batch = Batch.find params[:batch_id]
  	students = @batch.students
    @attendences = []
    @attend_id = []
    students.each do |g|
      @attendences  << Attendence.find_or_create_by(student_id: g.id, batch_id: @batch.id, attend: true, session_date: Date.current)
  	end 
  end

  def update_attendance
    absent = params["students_current_batch"]  - params['attend']
    para = {}
    params['students_current_batch'].each_with_index do |c, v |
      p c 
      para['remarks'] = params['remarks'][v]
      para['session_date'] = params['session_date'][v]
      para['attend'] = false if absent.include? c.to_s
      attendence  = Attendence.find c 
      attendence.update_attributes!(para)
    end 
  end


  # DELETE /centers/1
  # DELETE /centers/1.json
  def destroy
    @attendence.destroy
    respond_to do |format|
      format.html { redirect_to centers_url, notice: 'Attendence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @attendence = Attendence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendence_params
      params.require(:attendence).permit(:batch_id, :student_id, :remarks, :attend)
    end
end
