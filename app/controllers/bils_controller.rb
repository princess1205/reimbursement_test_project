class BilsController < ApplicationController
  def get_bils_list
    @bils_list = Bil.joins("inner join employees on bils.employee_id = employees.id").select("employees.first_name","claim_for","amount").all
  end

  def new
    puts "========================"
    @bils_list = Bil.new
    @employees = Employee.all
    puts "========================"
  end

  def create
    bil_data = params[:bil]
    employee_id = bil_data["employee_id"]
    claim_for = bil_data["claim_for"]
    # puts "======================= #{type.class}"
    amount = bil_data["amount"]
    @bils = Bil.new(:employee_id => employee_id, :claim_for => claim_for, :amount => amount)
    if @bils.save
        redirect_to :action => 'get_bils_list'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
