<?php

require_once('../app/libs/nusoap/nusoap.php');
 
require_once('../app/libs/phpmailer/class.phpmailer.php');
require_once('../app/libs/phpmailer/class.smtp.php');

class LoginController extends \Phalcon\Mvc\Controller {

    //login  
    public function indexAction() {
        $auth = $this->session->get('auth');
        if ($auth) {
            $this->response->redirect('/');
        }
        $this->view->setMainView('login');
        $this->view->setLayout('login');

        if ($this->request->isPost()) {
            $usuario = $this->request->getPost('username');
            $password = $this->request->getPost('password');
            $password = hash_hmac('sha256', $password, '2, 4, 6, 7, 9, 15, 20, 23, 25, 30');
            $user = usuarios::findFirst(
                            array(
                                "username = :usuario: AND password = :password: AND habilitado= :estado:",
                                "bind" => array('usuario' => $usuario, 'password' => $password, 'estado' => 1)
            ));
            if ($user != false) {         
                $user->logins = $user->logins + 1;
                $user->lastlogin = time();
                $user->save();
                $this->_registerSession($user);
                //$this->flashSession->success('Bienvenido <i>' . $user->nombre . '</i>');
                $this->response->redirect('/');
            }else{
                $this->flashSession->error('<b>Acceso denegado!</b> Usuario/contraseña incorrectos');    
            }
            
        }     
    }

    public function passwordAction() {
         $this->view->setMainView('login');
        $this->view->setLayout('login');
        if ($this->request->isPost()) {
            $email = $this->request->getPost('email');                        
            //buscamos el mail
            $user = usuarios::findFirst(
                            array(
                                "email = :email: AND habilitado= :estado:",
                                "bind" => array('email' => $email, 'estado' => 1)
            ));
            if ($user != false) {
                /*
                envio de email - restaurara contraseña
                 */
                
                
                    $destinatario = strtoupper($user->nombre).' '.strtoupper($user->paterno).' '.strtoupper($user->materno);
                    $correo_destinatario=$user->email;
                   
                    $string = utf8_encode($correo_destinatario);
                    $control = "C0m3rcial-123"; 
                    $string = $control.$string;
                    $string = base64_encode($string);

                    $contenido_html ='<p>Estimad@ '.$destinatario.', </p>
                    <p>Ha solicitado restablecer su contraseña, si esta seguro de hacerlo favor haga click en el siguiente enlace: </p>
                    <p><a href="http://'.$_SERVER ["SERVER_NAME"].'/login/recovery/'.$string.'">Recuperar Contraseña</a></p>
                    <p></p>';
                    $contenido = '';
                    $mail = new PHPMailer();
                    $mail->IsSMTP();
                    $mail->SMTPAuth = true;
                    $mail->SMTPSecure = "ssl";
                    $mail->Host = "correo.miteleferico.bo";
                    $mail->Port = 465;
                    $mail->Username = "sistemas@miteleferico.bo";
                    $mail->Password = "76KhCgc5";
                    $mail->From = "sistemas@miteleferico.bo";
                    $mail->FromName = "SISTEMA DE COMERCIALIZACION - \"MI TELEFERICO\" ";
                    $mail->Subject = utf8_decode("Restablecer Contraseña");
                    $mail->AltBody = $contenido;
                    $mail->MsgHTML(utf8_decode($contenido_html));
                    $mail->AddAddress($correo_destinatario, $destinatario);
                    $mail->IsHTML(true);
                    if(!$mail->Send()) {
                      $this->flashSession->error("<strong>Error: </strong>El correo electronico no existe.");
                  } else{
                    $this->flashSession->success("<strong>Exito: </strong>Revise su correo electronico ".$correo_destinatario.", se le envio la contraseña para restablecer. ");
                    }

            
            $this->response->redirect('/');
        
                /*
                end envio de email
                 */

                //acutalizamos la cantidad de ingresos
                // $user->logins = $user->logins + 1;
                // $user->lastlogin = time();
                // $user->save();
                // $this->_registerSession($user);
                // $this->flashSession->success('Bienvenido <i>' . $user->nombre . '</i>');
                // $this->response->redirect('/dashboard');
            }else{
            $this->flashSession->error('Email inexsitente en el sistema, o usuario No habilitado');    
            }
            
        }
    }
//registro de la session
    private function _registerSession($user) {
        $this->session->set('auth', array(
            'id' => $user->id,
            'name' => $user->username,
            'nombre' => $user->nombre,
            'cargo' => $user->cargo,
            'nivel' => $user->nivel,
        ));
    }    
    public function exitAction() {
        $this->session->remove('auth');
        $this->flash->success('Goodbye!');
        $this->response->redirect('/login');
    }


    public function recoveryAction($url='')
    {
         $this->view->setMainView('login');
        $this->view->setLayout('login');
        if ($this->request->isPost()) {
            if($url!=''){
                $string = base64_decode($url); 
                $control = "C0m3rcial-123"; 
                $email = str_replace($control, "", $string);
                $user = usuarios::findFirst(
                    array(
                        "email = :email: AND habilitado= :estado:",
                        "bind" => array('email' => $email, 'estado' => 1)
                        ));
                if ($user != false) {
                    $password_nuevo = $this->request->getPost('password_nuevo');
                    $password_repetir = $this->request->getPost('password_repetir');
            // $password = hash_hmac('sha256', $password, '2, 4, 6, 7, 9, 15, 20, 23, 25, 30');
            // if($user[0]->password == $password){
                    if($password_nuevo == $password_repetir){
                        $p =hash_hmac('sha256', $password_nuevo, '2, 4, 6, 7, 9, 15, 20, 23, 25, 30');
                        // $resul = usuarios::findFirstById($id);
                        $user->password = $p;
                        if ($user->save()) {
                            $this->flashSession->success('<b>Exito!</b> Contraseña actualizada correctamente');    
                             $this->response->redirect('/login');
                        }else{
                            $this->flashSession->error('<b>Error!</b> realice la operación de nuevo');            
                        }

                    }else{
                        $this->flashSession->error('<b>Error!</b> Nueva Contraseña no coincide con la contraseña repetida');        
                    }
                }   else{
                    $this->flashSession->error('Email inexsitente en el sistema, comuniquese con el administrador del sistema fvelasco@miteleferico.bo');
                } 
            }
        }
        $this->view->setVar('url', $url);
    }

    
}
