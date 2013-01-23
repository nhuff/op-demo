define s_mysql_server::user (
  $password
) {
  database_user{$title:
    password_hash => mysql_password($password),
  }
}
