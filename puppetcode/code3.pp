vi install.pp
class ntpmod::install
   package { "$ntpmodule::pkg":
   ensure => installed,
   }
vi congif.pp
class ntpmod::config{
   file { "/etc/ntp/ntpd.conf":
   ensure => file,
   config => template(httpmod/ntpdconf.erb,
   }
}
vi service.pp
class ntpmod::service inherits ntpmod{
   service {"$ntpmod::service":
   enable => true,
   ensure => running,
   }
}
vi init.pp
include ntpmod(
$pkg = $ntpmod::params::pkg
$drift = $ntpmod::params::drift
$service = $ntpmod::params::service
)inherits params{
include ntpmod::install
include ntpmod::config
include ntpmod::service
}
vi params.pp



