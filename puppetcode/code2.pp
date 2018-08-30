class package_installation {

   if $::osfamily == 'RedHat'{
    $pkgname = [ 'screen' , 'strace' , 'sudo' ]
 }
   elsif $::osfamily == 'Debian'{
    $pkgname = [ 'screen' , 'trace' , 'sudo' ]
     } else {
    $pkgname = [ 'screen' ]
    }


  package { $pkgname:
   ensure => present,
     }
}
include package_installation
