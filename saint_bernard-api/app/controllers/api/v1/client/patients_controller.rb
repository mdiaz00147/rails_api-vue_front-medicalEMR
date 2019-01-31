class Api::V1::Client::PatientsController < Api::V1::Client::ClientsController

  # list all patiens in the facility
  def index
    facility = Facility.first
    result   = facility.patients.all.order(created_at: :desc).map{|x| PatientHelper.filter(x)}
    render json: result, status: 200
  end

  # show summary of patient
  def show
    patient = Patient.find(params[:id])
    render json:  PatientHelper.filter(patient), status: 200
  end

  private
  
    
end
