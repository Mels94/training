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
        $SingleCinemaFilms = $films->getFilms();

        $this->view->setTitle('Single Cinema');
        $this->view->render('site/single_cinema', $SingleCinemaFilms);
        return true;
    }

    public function actionDateTime(){

        $dataTime = new Cinema($_POST['film']);
        echo json_encode($dataTime->dataTime());
        die;
    }

    public function actionError()
    {
        echo 'Action Error';
    }
}