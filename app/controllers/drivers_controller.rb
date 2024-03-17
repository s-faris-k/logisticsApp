class DriversController < ApplicationController
  

  # GET /drivers or /drivers.json
  def index
    @drivers = Driver.all
  end

 
  def new_driver
    @driver = Driver.new
  end

 

  
  def create_driver
 
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :index
    end
  end

   # GET /drivers/1/edit
  def edit_driver
    @driver=Driver.find_by(id:params[:id])
  end
  # PATCH/PUT /drivers/1 or /drivers/1.json
  def update_driver
    driver=Driver.find_by(id:params[:id])
    if driver.update(driver_params)
      redirect_to drivers_path
    else
      render :index
    end
  end
  # DELETE /drivers/1 or /drivers/1.json
  def delete_driver
    driver=Driver.find_by(id:params[:id])

    if driver.destroy
      redirect_to drivers_path
    else
      render :index
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def driver_params
      params.require(:driver).permit(:name, :contact)
    end
end
