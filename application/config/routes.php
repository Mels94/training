<?php

return [
    '' => [
        'controller' => 'site',
        'action' => 'index'
    ],
    'site/single_cinema/([0-9]+)' => [
        'controller' => 'site',
        'action' => 'single_cinema'
    ],
    'site/datetime' => [
        'controller' => 'site',
        'action' => 'dateTime'
    ],
    'site/datepicker' => [
      'controller' => 'site',
      'action' => 'datepicker'
    ],
    'site/row' => [
      'controller' => 'site',
      'action' => 'row'
    ],
    'error' => [
        'controller' => 'site',
        'action' => 'error'
    ]
];