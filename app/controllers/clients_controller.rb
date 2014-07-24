class ClientsController < ApplicationController
  def new
  	@client = Client.new

  end
  
  def create
  	@client = Client.new(user_params)
    if @client.save
      flash[:success] = "Client Added Successfully"
    redirect_to clients_path
  else
    flash[:failure] = "Something goes wrong.. Make sure that all blanks are filled and length of name must be less than 50 characters"
    redirect_to new_client_path
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
     @client = Client.paginate(page: params[:page], :per_page => 10)

  end

  def destroy

    @client = Client.find(params[:id])

    @client.destroy
    redirect_to clients_path
  end
  private


  def user_params
      params.require(:client).permit(:name, :country)
    end
end
