#-----------------------------------------------------------------------
#-*- vim: set ft=ruby: -*-
#
# Example repository for serving up a Mirror repository.  This repo
# will respond to mirroring requests and mirror gems from a remote
# repository locally.
#-----------------------------------------------------------------------
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'stickler/middleware/compression'
require 'stickler/middleware/mirror'

gem_dir = File.join(__dir__, 'tmp')

use ::Stickler::Middleware::Compression
use ::Stickler::Middleware::Mirror, repo_root: gem_dir
run ::Sinatra::Base
