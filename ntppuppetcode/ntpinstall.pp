class ntp_install {

   $pkg = 'ntp'
   $config = '/etc/ntp.conf'
   $driftfile = '/var/tmp/ntp/drift'
   $servicename = 'ntpd'
 
  package { "$pkg":
     ensure => installed,
     }

   file { "$config":
     owner => root,
     group => root,
     mode => '644',
     ensure => present,
     content => template('/root/code/ntppuppetcode/ntp.conf.erb'),
     require => Package[ "$pkg"],
     }

   service { "$servicename":
     ensure => running,
     enable => true,
     require => File[ "$config"],
     }
}
include ntp_install
