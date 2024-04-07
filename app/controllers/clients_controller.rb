class ClientsController < ApplicationController
  before_action :set_client, only: %i[ edit_client update_client delete_client ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end
 
  # GET /clients/new
  def new_client
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit_client
  
  end

  # POST /clients or /clients.json
  def create_client
      @client = Client.new(client_params)
      if @client.save
        redirect_to clients_path
      else
        render :create_client
      end
    end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update_client
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :new_client
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def delete_client
    if @client.destroy
      message = "success"
    else
      message="failes"
    end
    redirect_to clients_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :contact)
    end
end
