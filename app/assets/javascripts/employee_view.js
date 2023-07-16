window.onload = function() {
    $('.department-menu-item').on('click', function(e){
        var selected_item_id = $(e.currentTarget).attr('data-id');
        var dept_name = $(e.currentTarget).text();
        document.getElementById("departmentName").value = selected_item_id;
        $("#dropdownMenuButton").html(dept_name);
    });
}
