window.onload = function() {
    console.log("------------");
    $('.department-menu-item').on('click', function(e){
        debugger;
    
        var selected_item_id = $(e.currentTarget).attr('data-id');
        var dept_name = $(e.currentTarget).text();
        document.getElementById("favourite").value = selected_item_id;
        $("#dropdownMenuButton").html(dept_name);
    });
}
