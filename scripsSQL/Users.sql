CREATE USER 'admin'@'localhost' identified by 'Administracion.1234';

GRANT ALL PRIVILEGES ON patitolabs.* TO admin@localhost;
FLUSH PRIVILEGES;

ALTER USER 'admin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Administracion.1234';

FLUSH PRIVILEGES;