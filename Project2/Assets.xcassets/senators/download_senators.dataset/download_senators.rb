require "open-uri"
require "json"

open("./senators.json") do |file|
    contents = file.read
    senators = JSON.parse(contents)
    senators.each do |senator|
        state_code = senator["state_code_slug"]
        name_slug = senator["name_slug"]
        party = senator["party"]
        open(senator["photo_url"]) do |image|
            File.open("./#{state_code}-#{name_slug}-#{party}.jpg", "wb") do |file|
                file.write(image.read)
            end
        end
    end
end
