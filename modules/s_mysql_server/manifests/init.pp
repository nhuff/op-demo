class s_mysql_server (
  $databases = {},
  $users     = {},
  $grants    = {},
) {
  include mysql::server
  create_resources('database',$databases)
  create_resources('s_mysql_server::user',$users)
  create_resources('database_grant',$grants)
}
