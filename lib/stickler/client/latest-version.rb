module Stickler
  class Client
    class LatestVersion < Stickler::Client
      def self.banner
        <<-_
Prints the latest version of a gem

Usage: stickler latest-version gem-name

  Options:
        _
      end

      def parse(argv)
        gem_name = nil
        opts = super(argv) do |p, _o|
          raise Optimist::CommandlineError, 'At lest one gem-name is required' if p.leftovers.empty?

          gem_name = p.leftovers.shift
        end
        opts[:gem_name] = gem_name
        opts
      end

      def run
        opts = parse(argv)
        repo = remote_repo_for(opts)
        match = repo.latest_specs_list.find do |name, _version, _platform|
          name == opts[:gem_name]
        end
        if match
          $stdout.puts match[1]
        else
          $stdout.puts "Gem #{opts[:gem_name]} not found in remote repository"
        end
      rescue Stickler::Repository::Error => e
        $stdout.puts "ERROR: #{e.message}"
      end
    end
  end
end
