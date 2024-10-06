class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @patients = Patient.where("name ILIKE ? OR phone ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(10)
    else
      @patients = Patient.page(params[:page]).per(10)
    end
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'Patient was successfully destroyed.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :phone, :email, :address)
  end
end