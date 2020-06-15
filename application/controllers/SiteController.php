<?php

namespace application\controllers;

use application\base\BaseController;
use application\models\Cinema;


class SiteController extends BaseController
{
  public function actionIndex(){

    $cinema = new Cinema();
    $arrCinema = $cinema->getCinema();

    $this->view->setTitle('Cinema');
    $this->view->render('site/index', $arrCinema);
    return true;
  }

  public function actionSingle_cinema(){

    $films = new Cinema();
    $arrFilms = $films->getFilms();

    $this->view->setTitle('Single Cinema');
    $this->view->render('site/single_cinema', $arrFilms);
    return true;
  }

  public function actionError(){
    echo 'Action Error';
  }
}