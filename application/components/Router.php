<?php

namespace application\components;


class Router
{
    protected $routes = [];
    protected $params = [];

    public function __construct()
    {
        $arr = require 'application/config/routes.php';
        foreach ($arr as $key => $val) {
            $this->add($key, $val);
        }
    }

    public function add($route, $params)
    {
        $this->routes[$route] = $params;
    }

    public function getUri()
    {
        if (!empty($_SERVER['REQUEST_URI'])) {
            return trim($_SERVER['REQUEST_URI'], '/');
        }
        return false;
    }

    public function match()
    {
        $url = $this->getUri();
        foreach ($this->routes as $route => $params) {
            if (preg_match('/[?]/', $url)) {
                $url = preg_split('/[?]/', $url)[0];
            }
            if (preg_match("#^$route$#", $url, $matches)) {
                $this->params = $params;
                return true;
            }
        }
        return false;
    }

    public function getParams()
    {
        if (!empty($this->getUri())) {
            $url = $this->getUri();
            if (preg_match('#/([?])([a-z]+)=([0-9]+)#', $url)) {
                $arrUrl = explode('/', $url);
                $getParam = array_pop($arrUrl);
                return $param = array_pop($arrUrl);
            } else {
                $arrUrl = explode('/', $url);
                return $param = array_pop($arrUrl);
            }
        }
        return false;
    }

    public function run()
    {
        if ($this->match()) {
            $pathSite = 'application\controllers\\' . ucfirst($this->params['controller']) . 'Controller';
            if (class_exists($pathSite)) {
                $actionName = 'action' . ucfirst($this->params['action']);
                if (method_exists($pathSite, $actionName)) {
                    $controller = new $pathSite;
                    call_user_func_array(array($controller, $actionName), [$this->getParams()]);
                } else {
                    header('Location: /error');
                }
            } else {
                header('Location: /error');
            }
        } else {
            header('Location: /error');
        }
    }

}