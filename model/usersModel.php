<?php
// connect function
function connectUser($connect,$login,$pwd){
    // traitement des données
    $login = htmlspecialchars(strip_tags(trim($login)),ENT_QUOTES);
    $pwd = htmlspecialchars(strip_tags(trim($pwd)),ENT_QUOTES);
    // request
    $sql = "SELECT u.idusers, u.users_name, p.idpermissions, p.permissions_name
	FROM users u
    INNER JOIN permissions p 
		ON p.idpermissions = u.permissions_idpermissions
    WHERE u.users_name='$login' AND u.users_pwd='$pwd';";
    $recup = mysqli_query($connect,$sql) or die(mysqli_error($connect));

    if(mysqli_num_rows($recup)){
        return mysqli_fetch_assoc($recup);
    }else{
        return false;
    }

}

// disconnect user
function disconnectModel(){
    // Destroy session's variables
    $_SESSION = array();

    // Destroy the cookie
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

    // Destroy real session
    session_destroy();
}

// find all user (Rédacteur and administateur)
function AllUser($c){
    $sql="SELECT idusers, users_name FROM users ORDER BY users_name ASC;";
    $request = mysqli_query($c,$sql);
    return mysqli_fetch_all($request,MYSQLI_ASSOC);
}