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
        $dataPicker = new Cinema($_POST['id'], $_POST['start'], $_POST['end']);
        echo json_encode($dataPicker->datepicker());
        die;
    }

    public function actionRow()
    {
        $row = new Cinema($_POST['id']);
        $data = $row->rowAll();
        $checkoutSeats = $row->checkoutSeats();
        echo json_encode(['list' => $data, 'checkout' => $checkoutSeats]);
        die;
    }

    public function actionOkChecked()
    {
        $insertOrder = new Cinema($_POST['row'], $_POST['time']);
        if ($insertOrder->insertOrder()){
            echo json_encode(1);
            die;
        }
    }

    public function actionError()
    {
        $this->view->setLayout('error');
        $this->view->setTitle('error');
        $this->view->render('layout/error', []);
        return true;
    }
}