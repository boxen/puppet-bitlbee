# Internal: Configuration settings for Bitlbee.
#
# Examples
#
#   include bitlbee::config
class bitlbee::config {
  require boxen::config

  $configdir   = "${boxen::config::configdir}/bitlbee"
  $executable  = "${boxen::config::homebrewdir}/sbin/bitlbee"
  $logdir      = "${boxen::config::logdir}/bitlbee"
  $consolefile = "${logdir}/console.log"
  $port        = 6667
}
