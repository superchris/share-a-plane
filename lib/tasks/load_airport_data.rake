task load_airport_data: :environment do
  File.open("db/APT.txt").readlines.each do |line|
    if line[0..2] == "APT" #&& line[27..30] == "HAO "
      puts "Airport #{line[133..182]}"
      dgm_regex = /(\d+)-(\d+)-(\d+\.\d+)([a-zA-Z])/
      lat_match = dgm_regex.match(line[523..537])
      lng_match = dgm_regex.match(line[550..564])
      geo_coord = Geo::Coord.new(
        latd: lat_match[1],
        latm: lat_match[2],
        lats: lat_match[3],
        lath: lat_match[4],
        lngd: lng_match[1],
        lngm: lng_match[2],
        lngs: lng_match[3],
        lngh: lng_match[4]
      )
      Airport.create!(
        code: line[27..30].strip,
        description: line[133..182].strip,
        latitude: geo_coord.lat,
        longitude: geo_coord.lng
      )
    end
  end
end
