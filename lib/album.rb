class Album
  attr_reader :id, :name
  
  @@albums = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes[:id] || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new({name: self.name, id: self.id})
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@albums.delete(self.id)
  end

  def self.sort
    record_list = self.all
    sorted_records = record_list.sort_by{ |record| record.name }
    sorted_records
  end

  # def songs
  #   Song.find_by_album(self.id)
  # end
end