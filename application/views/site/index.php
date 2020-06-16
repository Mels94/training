

<div class="container">
  <div>
    <h2>today's movies</h2>
    <div class="row">
      <?php if (!empty($data) && isset($data[0])): ?>
      <?php foreach ($data[0] as $item): ?>
      <div class="col-md-3 open-film-modal" data-id="<?= $item['id']; ?>" data-name="<?= $item['name']; ?> (<?= $item['date'] ?>)"">
      <div class="content">
        <img src="<?= ASSETS ?>images/films/<?= $item['image_path']; ?>" alt="Mountains" style="width:100%; height: 200px">
        <h4><?= $item['name']; ?></h4>
      </div>
    </div>
    <?php endforeach; ?>
    <?php endif; ?>
  </div>
  </div>


<div class="mt-5">
  <h2>Cinemas</h2>
  <div class="row">
    <?php if (!empty($data) && isset($data[1])): ?>
      <?php foreach ($data[1] as $item): ?>
        <div class="col-md-3">
          <div class="content">
            <a href="site/single_cinema/<?= $item['id']; ?>">
              <img src="<?= ASSETS ?>images/cinema/<?= $item['image_path']; ?>" alt="Mountains" style="width:100%; height: 200px">
              <h4><?= $item['name']; ?></h4>
            </a>
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
