require 'spec_helper'

describe Pitchscrape::BestNewMusic do
  let(:fixture) { File.open(File.expand_path('../../bnm-fixture.html', __FILE__)) }
  let(:bnm) { Pitchscrape::BestNewMusic }

  before do
    allow(bnm).to receive(:doc).and_return(Nokogiri::HTML(fixture, nil, 'UTF-8').css('ul.bnm-list > li'))
  end

  it 'parses album artwork' do
    expect(bnm.albums.first.artwork).to eq "http://cdn2.pitchfork.com/albums/21283/list.a0908a64.jpg"
  end

  it 'parses album artwork' do
    expect(bnm.albums[1].artwork).to eq "http://cdn3.pitchfork.com/albums/21187/list.b02cb19b.jpg"
  end

  it 'parses album artwork' do
    expect(bnm.albums.last.artwork).to eq "http://cdn4.pitchfork.com/albums/21227/list.e0491b02.jpg"
  end

  it 'parses album title' do
    expect(bnm.albums.first.title).to eq "Faith in Strangers"
  end

  it 'parses album title' do
    expect(bnm.albums.last.title).to eq "Run the Jewels 2"
  end

  it 'parses album artist' do
    expect(bnm.albums.first.artist).to eq "Andy Stott"
  end

  it 'parses album artist' do
    expect(bnm.albums[2].artist).to eq "Clark"
  end

  it 'parses album rating' do
    expect(bnm.albums[2].rating).to eq "8.3"
  end

  it 'parses album rating' do
    expect(bnm.albums[3].rating).to eq "8.4"
  end

  it 'parses album review' do
    expect(bnm.albums.first.review).to eq "The Manchester electronic producer Andy Stott creates ghostly environments filled with glitches, pops, hazes, lurid synths, clarion vocals, graceful footwork, and enormous bass. His first substantive solo release since 2012’s masterful<i> Luxury Problems</i>, offers an expanding set of sounds and ideas. In the last three years, Stott has not only cemented his approach but also upped his ambition."
  end

  it 'parses album review' do
    expect(bnm.albums.last.review).to eq "It’s important to note that <i>Run the Jewels 2</i> is an <i>album</i>—it’s on a real label and you can pay money to own it. And the transition from mixtape-to-album explains every progression El-P and Killer Mike have made in the past year. Think of it as the <i>Hell Hath No Fury</i> to <i>Run the Jewels</i>’ <i>We Got It 4 Cheap</i>—the latter were freewheeling collaborations that introduced commercially exiled veterans to a new audience of microphone fiends and completely reframed their public perception. This is the most viciously realized rap album of 2014. "
  end

  it 'returns an array of album objects' do
    expect(bnm.albums.map(&:class)).to eq Array.new(5, Pitchscrape::Album)
  end
end