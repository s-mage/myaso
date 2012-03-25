# encoding: utf-8

require File.expand_path('../../spec_helper', __FILE__)

class Myaso::TokyoCabinet
  describe Words do
    let(:tmpdir) { Dir.mktmpdir }
    let(:myaso) { Myaso::TokyoCabinet.new(tmpdir, :manage) }

    subject { myaso.words }

    before { populate_tokyo_cabinet! myaso }

    after do
      myaso.close!
      FileUtils.remove_entry_secure tmpdir
    end

    should_behave_like_a_words!
  end
end
