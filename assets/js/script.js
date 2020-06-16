function appendSelect(data = []) {
    let option = ``;
    $.each(data, function (i, item) {
        option += `<option value="${item.id}">${item.start} to ${item.end}</option>`
    });
    return `<select class="custom-select change-date-film">
        <option disabled selected>Watch movie hours</option>
        ${option}
    </select> <div class="add-date-line mt-3"></div>`;
}

$(document).ready(function () {

    $(function () {
        $("#datepicker1, #datepicker2").datepicker();
    });

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
                modal.find('.content').html(appendSelect(data) + `<input type="hidden" value="0" id="date_id">`);
            }
        });
        let film_name = $(this).attr('data-name');
        modal.find('.title-name').text(film_name);
        modal.modal('show');
    });


    $(document).on('change', '.change-date-film', function () {
        let id = $(this).val();
        modal.find('#date_id').val(id);
        $.ajax({
            url: window.location.origin + '/site/row',
            type: 'post',
            dataType: 'json',
            data: {id: id},
            success: function (data) {
                $('.remove').remove();
                $.each(data.list, function (i, item) {
                    var td = '';
                    $.each(item, function (j, value) {
                        td += `<td data-id="${value.id}" class="ok-checked text-center">${value.number}</td>`;
                    });
                    modal.find('.add-date-line').append(`<tr class="tr_td remove">${td}</tr>`);
                });
                $.each(data.checkout, function (i, item) {
                    modal.find(`.add-date-line td[data-id=${item.row_id}]`).css('background-color', 'red').removeClass('ok-checked')
                })

            }
        })


    });
    $(document).on('click', '.ok-checked', function () {
        let date_id = modal.find('#date_id').val(),
            row_id = $(this).attr('data-id'),
            _this = $(this);
        Swal.fire({
            title: 'Are you sure?',
            text: "Order a new ticket!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'To order!'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    url: window.location.origin + '/site/okChecked',
                    type: 'post',
                    dataType: 'json',
                    data: {row: row_id, time: date_id},
                    success: function (data) {
                        if (data){
                            _this.css('background-color', 'red').removeClass('ok-checked');
                        }
                    }
                })
                Swal.fire(
                    'Ordered',
                    'The order is accepted',
                    'success'
                )
            }
        })


    })

    $('#datepicker_btn').on('click', function () {
        let start = $('#datepicker1').val();
        let end = $('#datepicker2').val();
        let a = start.split('/');
        let b = end.split('/');
        start = a[2] + '-' + a[0] + '-' + a[1];
        end = b[2] + '-' + b[0] + '-' + b[1];
        let href = window.location.href;
        let index = href.lastIndexOf('/');
        let id = href.slice(index+1);
        $.ajax({
            url: window.location.origin + '/site/datepicker',
            type: 'post',
            dataType: 'json',
            data: {id: id, start: start, end: end},
            success: function (data) {
                $('.all_films .row *').remove();
                $('.all_films h3').remove();
                $.each(data, function (i, item) {
                    $('.all_films .row').append(`
                        <div class="col-md-3 open-film-modal" data-id="${item.id}" data-name="${item.name} (${item.date})">
                          <div class="content">
                            <img src="../../assets/images/films/${item.image_path}" alt="Mountains" style="width:100%; height: 250px">
                            <h5>${item.name} <span>${item.date_kino}</span></h5>
                          </div>
                        </div>
            `);
                })
            }
        })
    });


});
