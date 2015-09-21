#
# Class to execute "rally-manage db_sync
#
class rally::db::sync {
  exec { 'rally-manage db_sync':
    path        => '/usr/bin',
    user        => 'rally',
    refreshonly => true,
    subscribe   => [Package['rally'], Rally_config['database/connection']],
    require     => User['rally'],
  }

  Exec['rally-manage db_sync'] ~> Service<| title == 'rally' |>
}
