
class ProjectsController < ApplicationController

  before_action :set_project, only:[:edit,:update,:destroy, :show]
    

  def new
    @project = Project.new
    
  end
  
  def create
    @project = Project.new(create_params)
    
    
      if @project.save 

        flash[:success] = "Project Added Successfully"
        redirect_to projects_path
      else
        render 'new'
      end
  end    
  

  def edit
    
  end

  def update
    if @project.save 
      flash[:success] = "Project updated Successfully"
      @project.update_attributes(update_params)
      redirect_to @project
    else
      render edit_project_path
    end
  end
 
 
  def destroy
     @project.destroy
     redirect_to projects_url
  end 

  def index
    
    @project = Project.search(params[:search],params[:stat],params[:client_id]).paginate(page: params[:page], :per_page => 10)
     
  end

  def show

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
 
  def update_params
      params.require(:project).permit(:Name, :Code, :Description, :BillingType, :StartDate,:DeadlineDate, :EndDate, :gitHubUrl, :status, :name, :country)
    end
   def create_params
      params.require(:project).permit(:Name, :Code, :Description, :BillingType, :StartDate,:DeadlineDate, :EndDate, :gitHubUrl, :status, :name, :country, :client_id)
    end

end