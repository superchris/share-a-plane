task :load_airport_data do
  File.open("db/APT.txt").readlines.each do |line|
    if line[0..2] == "APT"
      puts "Airport #{line[27..30]}"
    end
  end
end
