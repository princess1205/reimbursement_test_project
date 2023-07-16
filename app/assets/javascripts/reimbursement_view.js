window.onload = function() {
    $('.employee-menu-item').on('click', (e) => {
        selectItem(e, 'employeeName', 'employeeDropdownMenuButton');
    });

    $('.expense-type-menu-item').on('click', (e) => {
        selectItem(e, 'expense_category', 'expenseDropdownMenuButton');
    })

    function selectItem(e, id, menuItem) {
        var selected_item_id = $(e.currentTarget).attr('data-id');
        var dept_name = $(e.currentTarget).text();
        document.getElementById(id).value = selected_item_id;
        $("#" + menuItem).html(dept_name);
    }

    $("#datepicker").datepicker();
    $('#datepicker').on('click',function() {
        $("#datepicker").datepicker();
    });  
}