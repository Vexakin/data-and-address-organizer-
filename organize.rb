require "./zip_look_up"

search = Search.new

# contains file creating and sorting methods
class Organize 

    def open
        
#!/usr/bin/env ruby
@seen = {}

# Determine where to look for contracts
@path = Dir["Contracts/*.txt"]

# Set file name of final output
@filename = "#{Time.now.strftime('%Y-%m-%d')}-Mileage.txt"

# If the final output file already exists, then don't create it again
if(File.exist?(@filename) == false)
    File.new(@filename, 'a')
    end
end
    
    def pull_data
# Loop through the folder once for each file
@path.each do |file|

  # Loop through each line in a given file
  File.readlines(file).each do |line|

    # if a given line contains "Party Date"
    if line[/Party Date/i]
      # Once we've found a line, split the line into a 2 part array
      # after ": " and grab everything in the array at index 1
      @party_date = line.split(": ")[1]
    end

    # if a given line contains "Client"
    if line[/Client/]
      # Once we've found a line, split the line into a 2 part array
      # after ": " and grab everything in the array at index 1
      @client = line.split(": ")[1]
    end

    # if a given line contains "Entertainment Time"
    if line[/Entertainment Time/]
      # Once we've found a line, split the line into a 2 part array
      # after ": " and grab everything in the array at index 1
      @entertainment_time = line.split(": ")[1]
    end

    # if a given line contains "Location"
    if line[/Location/]
      # Once we've found a line, split the line into a 2 part array
      # after ": " and grab everything in the array at index 1
      @location = line.split(": ")[1]
    end

  # if a given line contains "Contact Phone"
    if line[/Contact/i || /Phone/i]
      # Once we've found a line, split the line into a 2 part array
      # after ": " and grab everything in the array at index 1
      @contact_phone = line.split(": ")[1]
    end
  end
    self.class.send(:attr_accessor, :location)
end
    def print(distance)
  # Combine the instance variables from the file into a single string
  party_info = "#{@client} | #{@party_date} | #{@entertainment_time} | #{@location} | #{@contact_phone} | #{@distance} "
    
    # Remove any line breaks that happen to show up and shouldn't be there
    party_info.gsub!(/(\S)[^\S\n]*\n[^\S\n]*(\S)/, '\1 \2')

   
  # Checks to see if party info has been seen before
    # if true removes string
    # if false adds to seen data
    if !@seen[party_info]
        @seen[party_info] = true
        else
        party_info = ""
    end
    
    # makes sure there is data in pary_info before writing to file
  if party_info != ""  
      # Write cleaned string to the final output file and add a single line break afterwards
      File.open(@filename, "a"){ |results_file| results_file.puts "#{party_info}\n"}
    end
  end
end
end