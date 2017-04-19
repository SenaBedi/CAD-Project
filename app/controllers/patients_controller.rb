#require 'patient_decorator'
class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
   @patients = Patient.all
    respond_to do |format|
    format.html
    format.json
   
   if params[:search]
    #select all the patients which match the search pattern
    @patients = Patient.search(params[:search])
    #order the selected rows(if any) ascending by created_at field/column
    @patients = @patients.order("created_at ASC")
    else
    #order all the rows descending by created_at field/column
    @patients = @patients.order("created_at DESC")
    end
   end
 end

  # GET /patients/1
  # GET /patients/1.json
  def show
   @patient = Patient.find(params[:id])
  end

  # GET /patients/new
  def new
    @patient = Patient.new(params[:patient])
  end

  # GET /patients/1/edit
  def edit
   @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
 def create
  @patient = Patient.new(patient_params)
    # @patient.firstname = params[:patient][:firstname]
     #@patient.lastname = params[:patient][:lastname]
     #@patient.DOB = params[:patient][:DOB]
     #@patient.address = params[:patient][:address]
     #@patient.phone = params[:patient][:phone]
     #@patient.infection = params[:patient][:infection]

   #create an instance of the patient
  # mypatient = Patient.new(@Patient.infection, @Patient.firstname)
   #add the extra features to the new car
  #if params[:patient][:headache].to_s.length > 0 then mypatient = HeadDecorator.new(mypatient) 
  #end

  #if params[:patient][:fever].to_s.length > 0 then mypatient = BodyDecorator.new(mypatient)
  #end

  #if params[:patient][:cramp].to_s.length > 0 then mypatient = AbdominalDecorator.new(mypatient)
  #end

 #populate the cost and the description details
   #@patient.infection = mypatient.infection
   #@patient.description = mypatient.details
    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:firstname, :lastname, :DOB, :address, :phone, :infection)
    end
end

