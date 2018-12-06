#-----------------------------------------------------------------------
#-*- vim: set ft=ruby: -*-
#
# Example rackup file for using stickler as middleware in a larger application
#-----------------------------------------------------------------------
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'stickler'

root = File.expand_path(File.join(File.dirname(__FILE__), '..', 'test', 'data'))

puts root
use ::Stickler::Middleware::Server, stickler_root: root
run ::Sinatra::Base
