<?php

namespace application\controllers;

use application\base\BaseController;
use application\models\Cinema;


class SiteController extends BaseController
{
    public function actionIndex()
    {
        $cinema = new Cinema();
        $nowDateFilms = $cinema->nowDayFilms();

        $arrCinema = $cinema->getCinema();

        $this->view->setTitle('Cinema');
        $this->view->render('site/index', [$nowDateFilms, $arrCinema]);
        return true;
    }

    public function actionSingle_cinema($id)
    {
        $films = new Cinema($id);
        $viewCinema = $films->viewCinema();
        $SingleCinemaFilms = $films->getFilms();

        $this->view->setTitle('Single Cinema');
        $this->view->render('site/single_cinema', [$viewCinema, $SingleCinemaFilms]);
        return true;
    }

    public function actionDateTime()
    {
        $dataTime = new Cinema($_POST['film']);
        echo json_encode($dataTime->dataTime());
        die;
    }

    public function actionDatepicker()
    {
        $dataPicker = new Cinema(null, $_POST['start'], $_POST['end']);
        echo json_encode($dataPicker->datepicker());
        die;
    }

    public function actionRow()
    {
        $arrRow = [];
        $row = new Cinema($_POST['id']);
        $data = $row->rowAll();
        //$columnCount = $row->columnCount();
        //$rowCount = $row->rowCount();

        /*    $count = 0;
            for ($i = 0; $i <= count($data); $i++) {
              //var_dump($data[$i]['column_id']);

              if ($data[$i]['column_id'] != $data[$i + 1]['column_id']) {
                $count++;
                $arrRow[$count] = [];
              }
              array_push($arrRow[$count], ['id' => $data[$i+1]['id']]);
            }*/

        $checkoutSeats = $row->checkoutSeats();
        echo json_encode(['list' => $data, 'checkout' => $checkoutSeats]);
        die;
    }


    public function actionError()
    {
        echo 'Action Error';
    }
}