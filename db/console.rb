require("pry")
require_relative("../models/artists")
require_relative("../models/albums")


# Albums.delete_all
# Artists.delete_all()

artist1 = Artist.new({"name" => "AC/DC"})
artist1.save()

album1 = Albums.new({

    "name" => "Who Made Who",
    "genre" => "Hard Rock",
    "artist_id" => artist1.id
  })
  album1.save()


binding.pry
nil
