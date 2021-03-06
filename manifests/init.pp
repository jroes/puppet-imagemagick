class imagemagick {
  include homebrew
  include xquartz

  homebrew::formula {
    'xz':
      source => 'puppet:///modules/imagemagick/brews/xz.rb',
      before => Package['boxen/brews/xz'] ;
    'little-cms2':
      source => 'puppet:///modules/imagemagick/brews/little-cms2.rb',
      before => Package['boxen/brews/little-cms2'] ;
    'imagemagick':
      before => Package['boxen/brews/imagemagick'] ;
  }

  package {
    'boxen/brews/xz':
      ensure  => '5.0.4-boxen1'
      before  => Package['boxen/brews/imagemagick'] ;
    'boxen/brews/little-cms2':
      ensure  => '2.4-boxen1',
      before  => Package['boxen/brews/imagemagick'],
      require => Class['xquartz'] ;
    'boxen/brews/imagemagick':
      ensure  => '6.8.0-10-boxen1',
      require => Class['xquartz'] ;
  }
}
