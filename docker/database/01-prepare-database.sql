CREATE DATABASE vufind;

GRANT SELECT,INSERT,UPDATE,DELETE on vufind.* TO 'vufind'@'%' IDENTIFIED BY 'vufind';

FLUSH PRIVILEGES;
