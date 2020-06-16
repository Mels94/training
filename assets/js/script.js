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

  $( function() {
    $( "#datepicker1, #datepicker2" ).datepicker();
  } );


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
        });
        let film_name = $(this).attr('data-name');
        modal.find('.title-name').text(film_name);
        modal.modal('show');
    });


    $(document).on('change', '.change-date-film', function () {

        //modal.find('.add-date-line').html('<tr>efgr</tr>');

      let id = $(this).val();
      $.ajax({
        url: window.location.origin + '/site/row',
        type: 'post',
        dataType: 'json',
        data: {id: id},
        success: function (data) {
          console.log(data);


/*          $('.remove').remove();
          $.each([1,2], function (i, item) {
            modal.find('.add-date-line').append(`<tr class="tr_td remove">             
                                     </tr>`);
          });
          $.each([9,15,5,8], function (j, value) {
            $('.tr_td').append(`<td></td>`)
          });*/
        }
      })


    });


    $('#datepicker_btn').on('click', function () {
      let start = $('#datepicker1').val();
      let end = $('#datepicker2').val();
      let a = start.split('/');
      let b = end.split('/');
      start = a[2]+'-'+a[0]+'-'+a[1];
      end = b[2]+'-'+b[0]+'-'+b[1];
      $.ajax({
        url: window.location.origin + '/site/datepicker',
        type: 'post',
        dataType: 'json',
        data: {start: start, end: end},
        success: function (data) {
          $('.all_films .row').remove();
          $('.all_films h3').remove();
          $.each(data, function (i, item) {
            console.log(item);
            $('.all_films').append(`
              <div class="row">
                    <div class="col-md-3 open-film-modal" data-id="${item.id}" data-name="${item.name} (${item.date})">
                      <div class="content">
                        <img src="../../assets/images/films/${item.image_path}" alt="Mountains" style="width:100%; height: 200px">
                        <h5>${item.name}</h5><span>${item.date_kino}</span>
                      </div>
                    </div>
              </div>
            `);
          })
        }
      })


    });


});
