$(document).on('change', '#date_interval select.type', function () {
    if ($(this).find('option:selected').val() == 'manual') {
        $('#date_interval .manual').show();
    } else {
        $('#date_interval .manual').hide();
        modifyIntervalLink();
    }
});

$(document).on('click', '#date_interval .apply', function () {
    modifyIntervalLink();
});

function modifyIntervalLink() {
    var interval = $('#date_interval select.type').find('option:selected').val();
    var currentPath = new CurrentPath().update_param('interval', interval);
    if (interval == 'manual') {
        currentPath.update_param('from', $('#date_interval .from').val()).update_param('to', $('#date_interval .to').val());
    } else {
        currentPath.remove_param('from').remove_param('to');
    }
    window.location.replace(currentPath.get_path());
}