module Stickler::Middleware
  module Helpers
    #
    # set what, if any kind of compression to use on the response This is a Gem
    # server specific type compressions, as it does not set the http headers and
    # such in the same manner as normal compressed HTTP responses
    #
    # compression may be set to one of the following, all others will be
    # ignored.
    #
    # <b>:gzip</b>::    use Gem::Util.gzip
    # <b>:deflate</b>:: use Gem.deflate
    # <b>nil</b>::      no compression
    #
    module Compression
      def compression=(type)
        env["stickler.compression"] = type
      end

      def compression
        env["stickler.compression"]
      end
    end

    #
    # Manage the contents of the <tt>stickler.specs</tt> environment variable.
    # It is used as as communcation method between the various types of
    # middlewares managing gem repositories.  The Index server will use the
    # values in this variable in generating the responses to gem index requests
    #
    # env['stickler.specs'] is a Hash itself, the key being the return value of
    # +root_dir+ from the Class it is included in, the value for each key is
    # the Array of SpecLite's.
    #
    #
    module Specs
      #
      # The specs by repository
      #
      def specs_by_repo
        Stickler::Repository::Local.repos
      end

      #
      # return the list of all the specs in all the repos
      #
      def specs
        collect_specs_via(:specs)
      end

      #
      # return the list of all the latest_specs in all the repos
      #
      def latest_specs
        collect_specs_via(:latest_specs)
      end

      #
      # return the list of all the pre-release specs
      #
      def prerelease_specs
        collect_specs_via(:prerelease_specs)
      end

      #
      # return just the list of the releeased specs in all the repos
      #
      def released_specs
        collect_specs_via(:released_specs)
      end

      #
      # Collect all the specs via a call on each Repository
      #
      def collect_specs_via(method)
        specs_by_repo.values.collect do |idx|
          idx.send(method)
        end.flatten.sort
      end

      #
      # return the specs as a hash of lists, keyedy by gemname
      #
      def specs_by_name
        specs_grouped_by_name(specs)
      end

      #
      # Return all the specs as a hash of specs_by_name.  The keys
      # in this case are the first character of the gem name
      #
      def specs_by_first_upcase_char
        by_char = Hash.new { |h, k| h[k] = [] }
        specs.each do |spec|
          by_char[spec.name[0...1].upcase] << spec
        end

        by_char.keys.each { |k| by_char[k] = specs_grouped_by_name(by_char[k]) }
        by_char
      end

      #
      # Given a list of specs, this will group them by name
      #
      def specs_grouped_by_name(spec_list)
        by_name = Hash.new { |h, k| h[k] = [] }
        spec_list.each do |spec|
          by_name[spec.name.downcase] << spec
        end
        by_name
      end
    end
  end
end
