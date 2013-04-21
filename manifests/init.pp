# Public: Install Bitlbee.
#
# Examples
#
#   include bitlbee
class bitlbee {
    include bitlbee::config

    package { 'bitlbee':
        provider => homebrew,
        notify   => Service['bitlbee'],
    }

    file { [
        $bitlbee::config::configdir,
        $bitlbee::config::logdir,
    ]:
        ensure  => directory,
    }

    file { '/Library/LaunchDaemons/bitlbee.plist':
        content => template('bitlbee/bitlbee.plist.erb'),
        owner   => 'root',
        group   => 'wheel',
        notify  => Service['bitlbee'],
    }

    service { 'bitlbee':
        ensure  => running,
    }

}
