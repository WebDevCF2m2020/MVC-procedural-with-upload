<?php
// procedural mysqli connection

function connectDB(){
    $connect = @mysqli_connect(DB_HOST,DB_USER,DB_PWD,DB_NAME, DB_PORT);
    // if error
    if(mysqli_connect_errno()){
        return false;
    }
    // change charset
    mysqli_set_charset($connect,DB_CHARSET);

    return $connect;
}