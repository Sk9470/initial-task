class RecruitersController < AccessController
  before_action :set_recruiter, only: [:show, :update, :destroy]

  # GET /recruiters
  def index
    authorize Recruiter
    @recruiters = Recruiter.all
    render json: @recruiters
  end

  # GET /recruiters/1
  def show
    authorize @recruiter
    render json: @recruiter
  end

  # POST /recruiters
  def sign_up
    authorize Recruiter
    @recruiter = Recruiter.new(recruiter_params)
    if @recruiter.save
      render json: @recruiter, status: :created, location: @recruiter
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recruiters/1
  def update
    authorize @recruiter
    if @recruiter.update(recruiter_params)
      render json: @recruiter
    else
      render json: @recruiter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recruiters/1
  def destroy
    authorize @recruiter
    @recruiter.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter
      @recruiter = Recruiter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recruiter_params
      permitted_attributes(Recruiter)
    end
end
