# Parameters for puppet-rally
#
class rally::params {

  case $::osfamily {
    'RedHat': {
      $psycopg_package_name = 'python-psycopg2'
      $sqlite_package_name  = undef
    }
    'Debian': {
      $psycopg_package_name = 'python-psycopg2'
      $sqlite_package_name  = 'python-pysqlite2'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
