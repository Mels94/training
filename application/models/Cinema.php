<?php

namespace application\models;

use application\components\Db;


class Cinema
{
    private $id;
    private $start;
    private $end;

    public function __construct($id = null, $start = null, $end = null)
    {
        if (isset($id)) {
            $this->id = $id;
        }

        if (isset($start) && $start != 'undefined--undefined') {
            $this->start = $start;
        } else {
            $this->start = date("Y-m-d");
        }

        if (isset($end)) {
            $this->end = $end;
        }
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

    public function viewCinema()
    {
        $select = Db::getConnection()->prepare("SELECT * FROM `cinemas` WHERE `id`='$this->id'");
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


    public function datepicker()
    {
        $andWhere = '';
        if (isset($this->id)) {
            $andWhere = " AND cinema_id = {$this->id} ";
        }
        $select = Db::getConnection()->prepare("SELECT * FROM `films` WHERE `date`>='$this->start' 
            AND `date`<='$this->end' $andWhere");
        $select->execute();
        return $select->fetchAll(\PDO::FETCH_ASSOC);
    }


    public function rowAll()
    {
        $test = [];
        $column = Db::getConnection()->prepare("SELECT * FROM `column`");
        $column->execute();
        $list = $column->fetchAll(\PDO::FETCH_ASSOC);
        foreach ($list as $index => $item) {
            $line_count = Db::getConnection()->prepare("SELECT * FROM `row` WHERE `column_id` = {$item['id']}");
            $line_count->execute();
            $line_count = $line_count->fetchAll(\PDO::FETCH_ASSOC);
            array_push($test, $line_count);
        }
        return $test;
    }

    public function checkoutSeats()
    {
        $select = Db::getConnection()->prepare("SELECT * FROM `checked` WHERE `date_time_id`='$this->id'");
        $select->execute();
        return $select->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function insertOrder()
    {
        $insert = Db::getConnection()->prepare("INSERT INTO `checked` (`date_time_id`, `row_id`) VALUES (?,?)");
        $insert->execute([$this->start, $this->id]);
        return true;
    }


}