require_relative("../db/sql_runner")

class Artist
    attr_accessor :name
    attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
end

def save()

  sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
  values = [@name]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i
end

def self.all()
  sql = "SELECT * FROM artists"
  artist_list = SqlRunner.run(sql)
  return artist_list.map{|artist| Artist.new(artist)}
end

def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums_list = SqlRunner.run(sql, values)
    albums = albums_list.map{|albums_list| Albums.new(albums_list)}
    return albums

  end


  




end
