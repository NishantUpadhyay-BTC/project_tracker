class ClientsController < ApplicationController
  def new
  	@client = Client.new

  end
  def show
    @client = Client.find(params[:id])
    # @project = Project.find(@client)
  end
  def create
  	@client = Client.new(user_params)

    if @client.save
      flash[:success] = "Client Added Successfully"
      redirect_to clients_path
  else
    flash[:failure] = "Something goes wrong.. Make sure that all blanks are filled and length of name must be less than 50 characters"
    redirect_to clients_path
  end
  end
  def edit
    @client = Client.find(params[:id])
  end
  def update
    @client = Client.find(params[:id])
    if @client.update(user_params)
    redirect_to clients_path
  else
    flash[:failure] = "cant be blamk"
  end
  end
   def index
     @clients = Client.paginate(page: params[:page], :per_page => 10)
     @client = Client.new
      respond_to do |format| 
        format.html
        format.js
      end
  end

  def destroy

    @client = Client.find(params[:id])

    @client.destroy
    redirect_to clients_path
  end

  def toggle_div     
     render :update do |page|
          page.toggle("toggle_div")
     end
end
  private


  def user_params
      params.require(:client).permit(:name, :country)
    end
end
