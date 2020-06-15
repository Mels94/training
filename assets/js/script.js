function appendSelect(data = []) {
    let option = ``;
    $.each(data, function (i, item) {
        option += `<option value="${item.id}">${item.start} to ${item.end}</option>`
    })
    return `<select class="custom-select change-date-film">
        <option disabled selected>Watch movie hours</option>
        ${option}
    </select> <div class="add-date-line"></div>`;
}

$(document).ready(function () {
    let modal = $('#exampleModal');
    $(document).on('click', '.open-film-modal', function () {
        modal.find('.content *').remove();
        let film_id = $(this).attr('data-id');
        $.ajax({
            url: window.location.origin + '/site/datetime',
            type: 'post',
            dataType: 'json',
            data: {film: film_id},
            success: function (data) {
                modal.find('.content').html(appendSelect(data));
            }
        })
        let film_name = $(this).attr('data-name');
        modal.find('.title-name').text(film_name);
        modal.modal('show');
    });


    $(document).on('change', '.change-date-film', function () {
        modal.find('.add-date-line').html('<h2>4165</h2>');
    });



});
