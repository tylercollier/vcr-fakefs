require 'vcr'
require 'fakefs/safe'

module VCR
  module FakeFS
    class FakeFSPersister
      def initialize
        @orig_fs_persister = VCR.cassette_persisters[:file_system]
        @storage_location = @orig_fs_persister.storage_location
      end

      # I got this idea from: http://www.alfajango.com/blog/method_missing-a-rubyists-beautiful-mistress/
      fs_mod = VCR::Cassette::Persisters::FileSystem
      fs_mod.instance_methods(false).concat(fs_mod.private_instance_methods(false)).each do |name|
        define_method(name) do |*args, &block|
          ::FakeFS.without do
            @orig_fs_persister.send name, *args, &block
          end
        end
      end
    end
  end
end
