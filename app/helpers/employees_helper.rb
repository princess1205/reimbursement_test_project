module EmployeesHelper
    def employee_javascript_tag(dirname)
        src = "app/assets/javascripts/#{dirname}.js"
        javascript_include_tag(src)
    end
end
