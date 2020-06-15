<?php

namespace application\models;

use application\components\Db;


class Cinema
{
  public function getCinema(){
    $select = Db::getConnection()->prepare("SELECT * FROM `cinemas`");
    $select->execute();
    return $select->fetchAll(\PDO::FETCH_ASSOC);
  }

  public function getFilms(){
    $select = Db::getConnection()->prepare("SELECT * FROM `films` WHERE `cinema_id`='1' AND `date`=CURDATE()");
    $select->execute();
    return $select->fetchAll(\PDO::FETCH_ASSOC);
  }
}