#-----------------------------------------------------------------------
# Example rackup file for an entire stickler stack with authorization
#
# -*- vim: set ft=ruby: -*-
#-----------------------------------------------------------------------
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'stickler'

tmp = File.expand_path(File.join(File.dirname(__FILE__), '..', 'test', 'tmp'))

use Rack::Auth::Basic, 'Secure Stickler' do |u, p|
  (u == 'stickler') && (p == 'secret')
end
run Stickler::Server.new(tmp).app
