class JobSeekersController < AccessController
  before_action :set_job_seeker, only: [:show, :update, :destroy]

  # GET /job_seekers
  def index
    authorize JobSeeker
    skip_policy_scope
    @job_seekers = JobSeeker.filter(params, current_user)
    render json: @job_seekers
  end

  # GET /job_seekers/1
  def show
    authorize @job_seeker
    render json: @job_seeker
  end

  # POST /job_seekers
  def sign_up
    authorize JobSeeker
    @job_seeker = JobSeeker.new(job_seeker_params)

    if @job_seeker.save
      render json: @job_seeker, status: :created, location: @job_seeker
    else
      render json: @job_seeker.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_seekers/1
  def update
    authorize @job_seeker
    if @job_seeker.update(job_seeker_params)
      render json: @job_seeker
    else
      render json: @job_seeker.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_seekers/1
  def destroy
    authorize @job_seeker
    @job_seeker.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_seeker
      @job_seeker = JobSeeker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_seeker_params
      permitted_attributes(JobSeeker)
    end
end
