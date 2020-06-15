<h1>Single Sinema</h1>

<?php
//echo '<pre>';
//var_dump($data);
?>


<div class="container">
    <h2>Single Cinema Films</h2>
    <div class="row">
        <?php if (!empty($data) && isset($data)): ?>
            <?php foreach ($data as $item): ?>
                <div class="col-md-3 open-film-modal" data-id="<?= $item['id']; ?>" data-name="<?= $item['name']; ?> (<?= $item['date'] ?>)">
                    <div class="content">
                        <a data-toggle="modal">
                            <img src="<?= ASSETS ?>images/films/<?= $item['image_path']; ?>" alt="Mountains" style="width:100%; height: 200px">
                            <h4><?= $item['name']; ?></h4>
                        </a>
                    </div>
                </div>
            <?php endforeach; ?>
        <?php endif; ?>
    </div>
</div>



<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title title-name" id="exampleModalLabel">126</h5>
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
