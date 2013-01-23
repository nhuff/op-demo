class s_php_app_server {
  anchor {'s_php_app_server::start':}
  anchor {'s_php_app_server::end':}
  include apache
  include apache::mod::php
  include mysql::php

  logrotate::rule{'httpd':
    path          => '/var/log/httpd/*log',
    compress      => true,
    missingok     => true,
    ifempty       => false,
    sharedscripts => true,
    postrotate    => '/sbin/service httpd reload > /dev/null 2>/dev/null || true',
    rotate_every  => 'day',
  }
  
  file{'/var/www/html/index.php':
    ensure  => 'file',
    content => "<?php phpinfo() ?>\n",
    mode    => '0644',
    require => Class[apache::mod::php],
  }

  service{'iptables':
    ensure => 'stopped',
    enable => false,
  }

  Anchor['s_php_app_server::start'] ->
  Class['apache']                   ->
  Class['mysql::php']               ->
  Anchor['s_php_app_server::end']
}
