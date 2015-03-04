require 'spec_helper'
require 'vcr-fakefs'

describe "vcr-fakefs" do
  let(:url) { "http://www.google.com/" }
  let(:cassette_path) { 'spec/fixtures/vcr_cassettes/site.yml' }
  let(:file_download_path) { 'site/page.html' }

  def download_file(url, output_path)
    uri = URI.parse(url)
    Net::HTTP.start(uri.host) do |http|
      resp = http.get uri.path
      FileUtils.mkdir_p 'site'
      File.open(file_download_path, "wb") do |file|
        file.write(resp.body)
      end
    end
  end

  it "downloads file to fake file system and writes vcr cassette in real file system", vcr: { cassette_name: 'site', record: :none } do
    expect(File.exists?(file_download_path)).to be false
    expect(File.exists?(cassette_path)).to be true
    FakeFS.activate!
    expect(File.exists?(cassette_path)).to be false

    download_file url, file_download_path

    expect(File.exists?(file_download_path)).to be true
    expect(File.exists?(cassette_path)).to be false
    FakeFS.deactivate!
    expect(File.exists?(file_download_path)).to be false
    expect(File.exists?(cassette_path)).to be true
  end
end