require "./organize"
require "./zip_look_up"

# organize contains methods for sorting and print
# zip_look is methods for zipcode distance look up
organize = Organize.new
zip_look = Search.new

# checks for file if nothing exist creates one
organize.open

# iterates thru contracts and sorts data to name , data location etc
organize.pull_data

# passes location from organize to zip look up 
# when i tryed to access @location from inside zip_look could find address
zip_look.zip_code_find(organize.location)

# searchs zip-codes for distance and extracts to @distance var
# finds the distance here and displays in terminal
zip_look.zip_code_distance


# print all collected data from pull_data
# can not find distance here ... where oh where did it go??
# i tryed passing @distance to print from outside the class
# but it still cant see the var
organize.print(zip_look.distance)


