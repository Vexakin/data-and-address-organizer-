#!/usr/bin/env ruby
path = Dir["Contracts/*.txt"]
filename ="Millage.txt"
total = Dir["Contracts"].length
i =0

if(File.exist?(filename) == false)
    File.new(filename, 'a')
    puts "File Created"
    else
    
end



while i <= total do
        path.each do |file|
            puts file
            f = File.open(file, 'r')
            a = f.readlines
            adrs = a[11].strip
            date = a[9].strip
            date = date.split(' ').reject{|n|n== "Party"}.join(' ') 
            print adrs
            print date
            File.open(filename, "a"){ |file| file.print date} 
            File.open(filename, "a"){ |file| file.print "         "} 
            File.open(filename, "a"){ |file| file.puts adrs} 
             File.open(filename, "a"){ |file| file.puts "Total Distance:"} 
            File.open(filename, "a"){ |file| file.puts ""} 
            i = i+1
    end
end

    
    
    
