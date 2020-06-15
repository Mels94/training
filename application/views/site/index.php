<h1>Index</h1>


<?php
//var_dump($data[0]);
?>


<div class="container">
    <h2>today's movies</h2>
    <div class="row">
        <?php if (!empty($data) && isset($data[0])): ?>
        <?php foreach ($data[0] as $item): ?>
            <div class="col-md-3">
                <div class="content">
                    <a href="site/single_cinema">
                        <img src="<?= ASSETS ?>images/films/<?= $item['image_path']; ?>" alt="Mountains" style="width:100%; height: 200px">
                        <h4><?= $item['name']; ?></h4>
                    </a>
                </div>
            </div>
        <?php endforeach; ?>
        <?php endif; ?>
    </div>


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


