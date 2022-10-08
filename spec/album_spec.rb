require 'rspec'
# require 'pg'
require 'album'
require 'song'
require 'pry'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('.save') do
    it("saves an album") do
      album = Album.new({:name => "Giant Steps"})
      album.save()
      album2 = Album.new({:name => "Blue"})
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new({:name => "Blue"})
      album2 = Album.new({:name => "Blue"})
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new({:name => "Giant Steps"})
      album.save()
      album2 = Album.new({:name => "Blue"})
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new({:name => "Giant Steps"})
      album.save()
      album2 = Album.new({:name => "Blue"})
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new({:name => "Giant Steps"})
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new({:name => "Giant Steps"})
      album.save()
      album2 = Album.new({:name => "Blue"})
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  # describe('#songs') do
  #   it("returns an album's songs") do
  #     album = Album.new({:name => "In Rainbows"})
  #     album.save()
  #     song = Song.new({:name => "Naima", :album_id => album.id})
  #     song.save()
  #     song2 = Song.new({:name => "Cousin Mary", :album_id => album.id})
  #     song2.save()
  #     expect(album.songs).to(eq([song, song2]))
  #   end
  # end

  # describe("#name") do
  #   it("returns the name of an album") do
  #     album = Album.new({:name => "In Rainbows"})
  #     expect(album.name()).to(eq("In Rainbows"))
  #   end
  # end
end