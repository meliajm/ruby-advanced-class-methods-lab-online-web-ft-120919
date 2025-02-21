require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    @@all << song 
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song 
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song 
    song
  end 
  
  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name) 
  end 
  
  def self.alphabetical()
    @@all.sort_by { |song| song.name}
  end 
  
  def self.new_from_filename(artist_songname)
    song = self.new 
    song.name = artist_songname.split("-")[1].split(".")[0].strip
    song.artist_name = artist_songname.split("-")[0].strip
    song
  end
  
  def self.create_from_filename(filename)
    song = self.create 
    song.name = filename.split("-")[1].split(".")[0].strip
    song.artist_name = filename.split("-")[0].strip
    song
    # binding.pry
    
  end 
  
  def self.destroy_all
    self.all.clear
  end
  
end
