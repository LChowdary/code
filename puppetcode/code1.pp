class package_installation{
  $pkgname = [ 'screen' , 'strace' , 'sudo' ]

  package { $pkgname:
   ensure => present,
     }
}
include package_installation
