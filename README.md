#ATO project

#Description
Its a wordpress website for public organization (ГО "Асоціація учасників АТО Львівщини") where users can view news, photos, 
videos, get a lawyer advice and answers to frequently asked questions.

#Installation

1. Clone this project
2. Install any ftp client you like (FileZilla, etc.)
3. set your own into wp_config.php in the next lines:
define('DB_NAME', 'your db name');
define('DB_USER', 'your user name');
define('DB_PASSWORD', 'your db password');
4. upload project to your host
5. run db_restore.php file from your browser to import data to database


- phpmyadmin version: 4.0.10deb1
- mysql version: 14.14