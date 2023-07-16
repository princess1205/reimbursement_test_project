class BilsController < ApplicationController
  def get_bils_list
    @bils_list = Bil.joins("inner join employees on bils.employee_id = employees.id").select("employees.first_name","claim_for","amount").all
  end

  def new
    @bils_list = Bil.new
    @employees = Employee.all
  end

  def create
    bil_data = params[:bil]
    employee_id = params["employee_id"]
    claim_for = params["expense_category"]
    amount = bil_data["amount"]
    expense_date = bil_data["expense_date"]
    @bils = Bil.new(:employee_id => employee_id, :claim_for => claim_for, :amount => amount, :expense_date => expense_date)
    if @bils.save
        redirect_to :action => 'get_bils_list'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
