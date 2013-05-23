<?php

class Login_Controller extends Base_Controller {

    public function __construct() {
        if (!Auth::check() && Input::get() != array()) {
            $this->filter('before', 'csrf');
        }
    }

    public function action_index() {
        if (Auth::check()) {
            if (Session::get('referer') != null && Session::get('referer') != URL::current())
                return Redirect::to(Session::get('referer'));
            else
                return Redirect::to(URL::base());
        }
        else {
            if (Input::get() != array()) {
                $email = Input::get('email');
                $password = Input::get('password');
                $referer = Input::get('referer');

                $credentials = array('username' => $email, 'password' => $password);

                if (Auth::attempt($credentials)) {
                    if ($referer == URL::current())
                        return Redirect::to(URL::base());
                    return Redirect::to($referer);
                }
                else {
                    return View::make('theme.login')->with('erreur', 'Email et/ou mot de passe incorrect...')->with('email', $email)->with('referer', $referer);
                }
            }
        }
        return View::make('theme.login');
    }

    public function action_logout() {
        Auth::logout();
        if (Request::server('http_referer') != null && Request::server('http_referer') != URL::current())
            return Redirect::to(Request::server('http_referer'));
        else
            return Redirect::to(URL::base());
    }

}