class FeesController < ApplicationController
  before_action :set_fee, only: [:show, :edit, :update, :destroy]

  # GET /fees
  # GET /fees.json
  def index
    @fees = Fee.all
  end

  # GET /fees/1
  # GET /fees/1.json
  def show
  end

  # GET /fees/new
  def new
    @fee = Fee.new
    @students = Student.all
    @months = Month.all
    @centers = Center.all
  end

  # GET /fees/1/edit
  def edit
    @students = Student.all
    @months = Month.all
    @centers = Center.all
  end

  # POST /fees
  # POST /fees.json
  def create
    @students = Student.all
    @months = Month.all
    @centers = Center.all
    @fee = Fee.new(fee_params)
    respond_to do |format|
      status = if @fee.fees_frequency == "quaterly"
        (@fee.month.id..@fee.month.id+2).each do |month|
          #next @fee.month_id == month
          fee_dup = @fee.dup
          fee_dup.month_id = month
          fee_dup.amount = @fee.amount / 3
          fee_dup.save!
          Transaction.create(transactable: fee_dup, name: "student fees", month_id: fee_dup.month.id)
        end
          #Transaction.create(transactable: @fee, name: "student fees")
          format.html { redirect_to @fee, notice: 'Fee was successfully created.' }
          format.json { render :show, status: :created, location: @fee }
      else
        if @fee.save
          Transaction.create(transactable: @fee, name: "student fees", month_id: @fee.month.id)
          format.html { redirect_to @fee, notice: 'Fee was successfully created.' }
          format.json { render :show, status: :created, location: @fee }
        else
          format.html { render :new }
          format.json { render json: @fee.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /fees/1
  # PATCH/PUT /fees/1.json
  def update
    respond_to do |format|
      if @fee.update(fee_params)
        format.html { redirect_to @fee, notice: 'Fee was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee }
      else
        format.html { render :edit }
        format.json { render json: @fee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fees/1
  # DELETE /fees/1.json
  def destroy
    @fee.destroy
    respond_to do |format|
      format.html { redirect_to fees_url, notice: 'Fee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee
      @fee = Fee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_params
      params.require(:fee).permit(:amount, :student_id, :transaction_date, :month_id, :fees_frequency, :center_id)
    end
end
