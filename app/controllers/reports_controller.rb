class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  
  
  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
    data = Date.today
    @visits = Visit.mesAtual(data)
    #@visits = Visit.mesAtual(Time.now.strftime("%d-%m-%Y"))
    #@visits = Visit.all
    respond_to do |format|
      format.html
      format.pdf { render_reportVisits(@visits) }
    end
    
  end

  

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:empresa_id, :user_id, :visit_id, :department_id)
    end

    def render_reportVisits(visits)
      report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'views', 'reports' ,  'relatorioVisitas.tlf')

      visits.each do |visit|
        report.list.add_row do |row|
          row.values nomeVisit: visit.name, 
                     cpfVisit: visit.cpf,
                     inicioVisit: visit.entrada,
                     fimVisit: visit.saida,
                     departamentoVisit: visit.department.nome,
                     funcVisit: visit.user.name
          #row.item(:nomeVisit).style(:color, 'red') unless visit.done?
        end
      end

      send_data report.generate, filename: 'relatorioVisitas.pdf', 
                                 type: 'application/pdf', 
                                 disposition: 'attachment'
    end
end
