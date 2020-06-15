<?php

namespace application\models;

use application\components\Db;


class Cinema
{
    private $id;

    public function __construct($id = null)
    {
        $this->id = $id;
    }

    public function nowDayFilms()
    {
        $select = Db::getConnection()->prepare("SELECT * FROM `films` WHERE `date`=CURDATE()");
        $select->execute();
        return $select->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getCinema()
    {
        $select = Db::getConnection()->prepare("SELECT * FROM `cinemas`");
        $select->execute();
        return $select->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function getFilms()
    {
        $select = Db::getConnection()->prepare("SELECT * FROM `films` WHERE `cinema_id`='$this->id'");
        $select->execute();
        return $select->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function dataTime()
    {
        $select = Db::getConnection()->prepare("SELECT * FROM `data_time` WHERE `film_id`='$this->id'");
        $select->execute();
        return $select->fetchAll(\PDO::FETCH_ASSOC);
    }
}