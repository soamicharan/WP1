class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
  
  # GET /candidates
  # GET /candidates.json
  def index
    unless params[:sort].nil?
      @candidates = Candidate.default_sort(params[:sort], params[:type])
    else
      @candidates = Candidate.all
    end
  end

  def dashboard
    redirect to candidate_path
  end

  def filter_result
    if filter_params!={}
      @filter_query = filter_params
    end
    print "boooooooooooooo"
    print filter_params
    unless params[:sort].nil?
      @candidates = Candidate.filter_records( params[:query], params[:sort], params[:type])
    else
      @candidates = Candidate.filter_records( filter_params )
    end
    render "index"
  end
  

  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:date_of_registration, :date_of_closure, :address, :age, :branch, :contact_number, :email, :experience, :gender, :name, :qualification, :registration_number, :remarks, :specialization, :source_of_registration, :state, :status, :zone)
    end

    def filter_params
      params.permit(:date_of_registration,:date_of_closure,:source_of_registration,:zone,:name,:branch,:state,:status,:custom_day)
    end

end
