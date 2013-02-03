require 'open-uri'
require './organize'

class Search
    
    def zip_code_find(location)
        #funtion stops working when i write directly to @zip
        #not sure why
        temp = location.scan(/\d\d\d\d\d/)
        @zip = "#{temp}"
      end  
    
    def zip_code_distance

        #site url to pull search data from 
        # #{zip} is replaced with zip_code for search
        @search_url = ("http://www.zip-codes.com/distance_calculator.asp?zip1=08002&zip2=#{@zip[2,5]}&Submit=Search")
        puts @search_url
        #searches zip-codes.com
        uri = open(search_url)do |file|
        File.readlines(file).each do |line|
             
            # looks for line containing the distance
        if line[/font-size:19px;\"\>/]
            # strips away the the distance and saves to @distance
            temp = line.scan(/\d??\d\d\.\d\d/)[1]
            puts temp #remove
            @distance = "#{temp}"
            end
        end
    end
end
    attr_accessor :distance , :search_url ,:fish
       end

