class ExpensesController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_expense, only: %i[ edit_expense update_expense delete_expense ]
  
  # GET /expenses or /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/new
  def new_expense
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit_edpense

  end

  # POST /expenses or /expenses.json
  # def create_expense
  #   @expense = Expense.new(expense_params)
  #     if @expense.save
  #       redirect_to expenses_path
  #     else
  #       render :create_expense
  #     end
  #   end
  def create_expense
    exp_details = params[:expDetails]
    exp_details.each do |exp|
      expense = Expense.new(
        date: exp['date'],
        item: exp['item'],
        amount: exp['amount'],
        driver: exp['driver'],
        vehicle: exp['vehicle']
      )
      expense.save
    end
    # Your remaining logic
  end


  # PATCH/PUT /expenses/1 or /expenses/1.json
  def update_expense
      if @expense.update(update_exp_params)
        redirect_to expenses_path
      else
        render :update_expense
      end
    end

  # DELETE /expenses/1 or /expenses/1.json
  def delete_expense
    if @expense.destroy
      message ="deleted"
    else
      message="error happened"
    end
    redirect_to expenses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def update_exp_params
      params.require(:expense).permit(:item, :amount, :driver_id, :vehicle_id)
    end

    def expense_params
      params.permit(expDetails: [:item, :amount, :driver, :vehicle, :date])
    end
end
