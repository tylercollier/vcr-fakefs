require 'vcr/fakefs/fakefs_persister'

module VCR
  module FakeFS
    VCR.configure do |c|
      c.cassette_persisters[:fakefs_persister] = VCR::FakeFS::FakeFSPersister.new
      c.default_cassette_options = { persist_with: :fakefs_persister }
    end
  end
end
