# == Class: rsyslog::logstash
#
# Full description of class role here.
#
# === Parameters
#
# [*spool_size*]
# [*remote_type*]
# [*custom_config*]
# [*server*]
# [*port*]
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::logstash': }
#
class rsyslog::logstash (
  $spool_size        = '1g',
  $remote_type       = 'tcp',
  $custom_config     = undef,
  $server            = 'localhost',
  $port              = '5544'
) inherits rsyslog {

  $content_real = $custom_config ? {
    ''      => template("${module_name}/340-logstash.conf.erb"),
    default => template($custom_config),
  }

  file { $rsyslog::params::logstash_conf:
    ensure  => present,
    owner   => root,
    group   => $rsyslog::params::run_group,
    content => $content_real,
    require => Class['rsyslog::config'],
    notify  => Class['rsyslog::service'],
  }
}
