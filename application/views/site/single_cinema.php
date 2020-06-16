
<h2 class="text-center"><?= $data[0][0]['name']; ?> Kinotatron</h2>


<div class="single_cinema">
  <img src="<?= ASSETS ?>images/cinema/<?= $data[0][0]['image_path']; ?>" alt="cinema">
  <div class="cinema_info">
    <p>City: <span><?= $data[0][0]['city']; ?></span></p>
    <p>Address: <span><?= $data[0][0]['address']; ?></span></p>
    <p>Phone: <span><?= $data[0][0]['phone']; ?></span></p>
  </div>
</div>


<div class="container">
  <div class="mt-5">
    <input type="text" id="datepicker1" placeholder="Start date">

    <input type="text" id="datepicker2" placeholder="End date">

    <button id="datepicker_btn" class="btn btn-success">Go</button>
  </div>



  <div class="all_films mt-5">
    <h3><?= $data[0][0]['name']; ?> cinema all films</h3>
    <div class="row">
      <?php if (!empty($data) && isset($data[1])): ?>
        <?php foreach ($data[1] as $item): ?>
          <div class="col-md-3 open-film-modal" data-id="<?= $item['id']; ?>" data-name="<?= $item['name']; ?> (<?= $item['date'] ?>)">
            <div class="content">
              <img src="<?= ASSETS ?>images/films/<?= $item['image_path']; ?>" alt="Mountains" style="width:100%; height: 200px">
              <h5><?= $item['name']; ?> </h5><span class=""><?= $item['date_kino']; ?></span>
            </div>
          </div>
        <?php endforeach; ?>
      <?php endif; ?>
    </div>
  </div>

</div>




<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title title-name" id="exampleModalLabel"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body content">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
