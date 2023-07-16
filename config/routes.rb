Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/employees" => "employees#employee_details"
  post "/employees/create" => "employees#create"
  get "/employees/create" => "employees#new"
  get "/bils" => "bils#get_bils_list"
  get "/bils/create" => "bils#new"
  post "/bils" => "bils#create"
  get "/reimbursement/portal" => "home_page#home"
end
