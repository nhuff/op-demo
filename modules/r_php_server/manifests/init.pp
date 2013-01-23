class r_php_server {
  include s_php_app_server
  include s_mysql_server

  Class['s_mysql_server'] -> Class['s_php_app_server']
}
