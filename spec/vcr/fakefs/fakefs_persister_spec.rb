require 'spec_helper'
require 'vcr/fakefs/fakefs_persister'

module VCR
  module FakeFS
    describe FakeFSPersister do
      it "properly mimics all methods of original file persister" do
        expect(subject.respond_to? :absolute_path_to_file).to be true
        # Test private method
        expect(subject.respond_to? :absolute_path_for).to be true
      end
    end
  end
end
