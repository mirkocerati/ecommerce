<?php

function logout() {
    unset($_SESSION["user_id"]);
}

function build_auth_form($auth_type = "") {
    switch(strtolower($auth_type)) {
        case "sign_up":
          return '  <div class="container">
          <div class="row">
            <div class="col-md-6 col-md-offset-3">
              <div class="block text-center">
                <h2 class="text-center">Crea un nuovo account</h2>
                <form class="text-left clearfix" action="perform/sign_up.php" method="post">
                  <div class="form-group">
                    <input type="text" class="form-control" name="name" placeholder="Nome">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" name="lastname" placeholder="Cognome">
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username">
                  </div>
                  <div class="form-group">
                    <input type="email" class="form-control" name="email" placeholder="Email">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password">
                  </div>

                  <div class="form-group">
                    <input type="password" class="form-control" name="password2" placeholder="Conferma password">
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-main text-center">Conferma registrazione</button>
                  </div>
                </form>
                <p class="mt-20">Hai già un account? <a href="https://mirko.lol/auth?auth_type=sign_in"> Accedi.</a></p>
                <p style="color: red" class="mt-20"><a style="color: red" href="recovery.php">Recupero account</a></p>
              </div>
            </div>
          </div>
        </div>';
          break;
        case "sign_out":
          logout();
          session_destroy();
          return "Logout avvenuto.";
          break;
        case "recovery":
          "Recvoery";
          break;
        default:
          return '  <div class="container">
          <div class="row">
            <div class="col-md-6 col-md-offset-3">
              <div class="block text-center">
                <a class="logo" href="../index.php">
                  <img src="../images/logo.png" alt="">
                </a>
                <h2 class="text-center">BENTORNATO!</h2>
                <form class="text-left clearfix" action="perform/sign_in.php" method="post">
                  <div class="form-group">
                    <input type="email" class="form-control"  name="email" placeholder="EMAIL">
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="PASSWORD">
                  </div>
                  <div class="text-center">
                    <button type="submit" class="btn btn-main text-center" >Accedi</button>
                  </div>
                </form>
                <p class="mt-20">Nuovo utente?<a href="https://mirko.lol/auth?auth_type=sign_up"> Crea un nuovo account!</a></p>
                
                <p style="color: red" class="mt-20"><a style="color: red" href="recovery.php">Recupero account</a></p>
              </div>
            </div>
          </div>
        </div>';
          break;
      }
}


?>