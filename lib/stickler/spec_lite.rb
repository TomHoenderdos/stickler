require 'rubygems/platform'
require 'rubygems/version'

module Stickler
  #
  # A lightweight version of a gemspec that only responds to name, version,
  # platform and full_name.  Many of the items in the rubygems world
  # deal with the triplet [ name, verison, platform ] and this class
  # encapsulates that.
  #
  class SpecLite
    include Comparable

    attr_reader :name
    attr_reader :version
    attr_reader :platform
    attr_reader :platform_string

    def initialize(name, version, platform = Gem::Platform::RUBY)
      @name = name
      @version = Gem::Version.new(version)
      @platform_string = platform.to_s
      @platform = Gem::Platform.new(platform)
    end

    def full_name
      "#{name}-#{version_platform}"
    end

    alias to_s full_name

    def file_name
      full_name + '.gem'
    end

    def spec_file_name
      full_name + '.gemspec'
    end

    def name_version
      "#{name}-#{version}"
    end

    def version_platform
      if (platform == Gem::Platform::RUBY) || platform.nil?
        version.to_s
      else
        "#{version}-#{platform_string}"
      end
    end

    def prerelease?
      version.prerelease?
    end

    def to_a
      [name, version.to_s, platform_string]
    end

    #
    # Convert to the array format used by rubygems itself
    #
    def to_rubygems_a
      [name, version, platform_string]
    end

    #
    # Lets be comparable!
    #
    def <=>(other)
      return 0 if other.object_id == object_id

      other = coerce(other)

      %i[name version platform_string].each do |method|
        us = send(method)
        them = other.send(method)
        result = us.<=>(them)
        return result unless result == 0
      end

      0
    end

    #
    # See if another Spec is the same as this spec
    #
    def =~(other)
      other = coerce(other)
      (other &&
              (name == other.name) &&
              (version.to_s == other.version.to_s) &&
              (platform_string == other.platform_string))
    end

    private

    def coerce(other)
      if self.class === other
        other
      elsif other.respond_to?(:name) &&
            other.respond_to?(:version) &&
            other.respond_to?(:platform_string)
        SpecLite.new(other.name, other.version, other.platform_string)
      else
        false
      end
    end
  end
end
