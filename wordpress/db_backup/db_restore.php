<?php

require_once ("../wp-config.php");

set_time_limit(1000);

$cmd = "mysql --user=".DB_USER." --password=".DB_PASSWORD." --host=".DB_HOST." ".DB_NAME." < db.sql";

exec("$cmd");
echo 'done';

?>
