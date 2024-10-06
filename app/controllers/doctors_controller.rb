class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def doctor_dashboard
    @patients_to_attend = current_doctor.patients_to_attend
    @attended_patients = current_doctor.attended_patients
  end
end