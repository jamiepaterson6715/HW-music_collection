require_relative("../db/sql_runner")
require_relative("artists")


class Albums

  attr_accessor  :name, :genre
  attr_reader :id, :artist_id

  def initialize(options)

    @name = options['name']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options["artist_id"].to_i
  end


def save()

  sql = "INSERT INTO albums( name, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
  values = [@name, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i

end

def self.all()
  sql = "SELECT * FROM albums"
  albums_list = SqlRunner.run(sql)
  return albums_list.map{|album| Albums.new(album)}
end

def artist()
  sql = "SELECT * FROM artists
  WHERE id =$1"
  values = [@artist_id]
  result = SqlRunner.run(sql, values)
  artist_list = result.first
  return Artist.new(artist_list)
end



end
