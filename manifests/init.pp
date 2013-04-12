# == Class: rsyslog
#
# Meta class to install rsyslog with a basic configuration. You probably want rsyslog::client or rsyslog::server
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog': }
#
class rsyslog {
  class { 'rsyslog::install': }
  class { 'rsyslog::config':
    require => Class['rsyslog::install'],
  }
  class { 'rsyslog::service':
    subscribe => Class['rsyslog::config'],
  }
}
