Stickler Changelog
==================
Jeremy Hinegardner <jeremy@copiousfreetime.org>

Version 2.4.2 - 2015-03-12
--------------------------
* Drop support for ruby 1.8
* Update dependencies
* Fix mirror errors when no gem-version supplied <https://github.com/copiousfreetime/stickler/issues/42>
* Fix yank/unank of non-ruby platform gems <https://github.com/copiousfreetime/stickler/issues/45>

Version 2.4.1 - 2014-06-11
--------------------------
* Fix daemonization bug <https://github.com/copiousfreetime/stickler/issues/38>
* Require minimum rubygems version <https://github.com/copiousfreetime/stickler/issues/36>
* Clear all rubygems specification warnings
* Updated dependencies to latest versions

Version 2.4.0 - 2013-11-13
--------------------------
* Ruby 2.0 compatibility <http://github.com/copiousfreetime/stickler/issues/28>
* Implement latest-version command <http://github.com/copiousfreetime/stickler/issues/29>
* Extract Server functionality to Middleware <http://github.com/copiousfreetime/stickler/issues/33>
* Allow using Gemfile.lock as input to the `mirror` command <https://github.com/copiousfreetime/stickler/pull/31>
* Updated dependencies to latest versions

Version 2.3.0 - 2013-03-09
--------------------------
* Expose deleting a gem via the stickler commandline <http://github.com/copiousfreetime/stickler/issues/10>
* Update dependencies for Excon so http proxy works http://github.com/copiousfreetime/stickler/issues/24>
* Implement unyank for local and remote repositories <http://github.com/copiousfreetime/stickler/issues/26>
* Updated dependencies to latest versions

Version 2.2.4 - 2012-02-26
--------------------------
* Fixed authentication failing on mirror command <http://github.com/copiousfreetime/stickler/issues/12>
* Fixed 'list' command not working when no flags where given
* Fixed latest_specs not having all platforms in it <http://github.com/copiousfreetime/stickler/issues/21>

Version 2.2.2 - 2012-02-13
--------------------------
* Updated dependencies to latest versions
* Added supoort for <http Basic Auth in the client

Version 2.1.4 - 2011-09-09
--------------------------
* Update dependencies to newest version

Version 2.1.3 - 2011-07-24
--------------------------
* Do not feed ARGV strings directly into Gem::Version <http://github.com/copiousfreetime/stickler/issues/4>
* In web page, display gems in sort order, not lexical order <http://github.com/copiousfreetime/stickler/issues/16>
* Make sure Rack body's respond to #each <http://github.com/copiousfreetime/stickler/issues/17>

Version 2.1.2 - 2011-03-31
--------------------------
* Fix bug introduced in 2.1.1 where .gemspec urls would match but .gem urls would not

Version 2.1.1 - 2011-03-31
--------------------------
* Fix bug where stickler would only serve ruby platform gems

Version 2.1.0 - 2011-03-25
--------------------------
* Added 'list' client command
* Added support for prerelease gems
* Internal refactoring of how internal repositories are managed
* Refactored testing and updated to rspec2
* Switched underlying HTTP client to Excon
* Change to ISC License

Version 2.0.1 - 2010-09-19
--------------------------
* Complete rewrite using Rack and Sinatra

Version 0.1.2 - 2009-02-19
--------------------------
* fix compatibility with gems 1.3.1

Version 0.1.1 - 2008-10-12
--------------------------
* remove unnecessary require 'progressbar' 

Version 0.1.0 - 2008-10-10
--------------------------
* [Managing a Gem Repository with Stickler](http://copiousfreetime.org/articles/2008/10/09/managing-a-gem-repository-with-stickler.html)
* Initial public release
