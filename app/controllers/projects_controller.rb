class ProjectsController < ApplicationController

  before_action :set_project, only:[:edit,:update,:destroy, :show]
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(user_params)

      if @project.save

        flash[:success] = "Project Added Successfully"
        redirect_to @project
      else
        render 'new'
      end
  end    
  

  def edit
    
  end

  def update
    if @project.save 
      flash[:success] = "Project updated Successfully"
      @project.update_attributes(user_params)
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
    @project = Project.all
  end

  def show

  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
 
  def user_params
      params.require(:project).permit(:Name, :Code, :Description, :BillingType, :StartDate,:DeadlineDate, :EndDate, :gitHubUrl, :status)
    end
end