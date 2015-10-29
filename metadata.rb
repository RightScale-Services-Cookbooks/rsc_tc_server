name             'rsc_tc_server'
maintainer       'RightScale Inc'
maintainer_email 'premium@rightscale.com'
license          'Apache 2.0'
description      'Installs and Configures rsc_tc_server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'pivotal_repo'
depends 'pivotal_tcserver'
depends 'marker'

recipe 'rsc_tc_server::default', 'Installs and configures Pivotal TC Server'
