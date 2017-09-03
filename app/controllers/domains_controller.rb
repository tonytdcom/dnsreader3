class DomainsController < ApplicationController
  before_filter :authorize
  before_action :set_domain, only: [:show, :edit, :update, :destroy,]
  helper_method :sort_column, :sort_direction
  def index
        @domains = Domain.order("domain ASC")
          if params[:search]
           @domains = Domain.search(params[:search]).order("domain ASC")
          else
          @domains = Domain.all.order("domain ASC")
          end
  end
  
  def scans
    
  end
  
  def csvprocess
    @domains = Domain.all
  end
  
  def mxscan
     @domains = Domain.all
  end
  def sipscan
     @domains = Domain.all
  end

  def test 
     @domains = Domain.all
  end
  def summary
    
          @domains = Domain.all.paginate(page: params[:page], per_page: 20).order("#{sort_column} #{sort_direction}")
          @doms = Domain.all
          if params[:search]
          @domains = Domain.all.paginate(page: params[:page], per_page: 20).search(params[:search]).order("#{sort_column} #{sort_direction}")
          else
          @domains = Domain.all.paginate(page: params[:page], per_page: 20).order("#{sort_column} #{sort_direction}")
          end
  end
  
  def scanonedomain
     @domains = Domain.all
          if params[:search]
           @domains = Domain.search(params[:search]).order("domain ASC")
          else
          @domains = Domain.all.order("domain ASC")
          end
     
  end
  
  

  # GET /domains/1
  # GET /domains/1.json
  def show
    @domain = Domain.find(params[:id])
  end
  
  
  # GET /domains/new
  def new
    @domain = Domain.new
  end

  # GET /domains/1/edit
  def edit
  end

  # POST /domains
  # POST /domains.json
  def create
    @domain = Domain.new(domain_params)

    respond_to do |format|
      if @domain.save
        format.html { redirect_to @domain, notice: 'Domain was successfully created.' }
        format.json { render :show, status: :created, location: @domain }
      else
        format.html { render :new }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domains/1
  # PATCH/PUT /domains/1.json
  def update
    respond_to do |format|
      if @domain.update(domain_params)
        format.html { redirect_to @domain, notice: 'Domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @domain }
      else
        format.html { render :edit }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.json
  def destroy
    @domain.destroy
    respond_to do |format|
      format.html { redirect_to domains_url, notice: 'Domain was successfully destroyed.' }
      format.json { head :no_content }
    end
    
     
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domain
      @domain = Domain.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def domain_params
      params.require(:domain).permit(:domain, :spf, :dmarc, :mx, :txt, :sip)
    end
    
    def domainupdate_params
      params.permit(:domain, :spf, :dmarc, :txt, :mx, :sip)
    end
  
  
    def sortable_columns
    ["Domain", "Spf", "DMARC", "MX", "SIP"]
    end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "Domain"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  

end
