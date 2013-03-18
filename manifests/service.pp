# == Class: rsyslog::service
#
# This class enforces running of the rsyslog service.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'rsyslog::service': }
#
class rsyslog::service inherits rsyslog::params {

  service { $rsyslog::params::service_name:
    ensure  => running,
    require => Class['rsyslog::config'],
  }

}
