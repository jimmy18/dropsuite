class Checksamefile
	def hello
		puts "Hello DropSuite!" 
	end
	def hitfile(path)
		h = Hash.new
		if(File.directory?(path))     # check if input directory or not
			if(Dir.empty?(path)==false)  # check if directory empty or not
				Dir.glob(path+"/**/*") do |file|   #scan all files in directory and subdirectory
					i=0
					if File.file? file	
						if ((hit=Dir["**/"+file].length))
							isi=File.read(file)        # read file content
							if((h.has_key? isi)==true) # check if file content on hash or not
								for i in 0...1
									h[isi] += 1        # if true increment hash value
								end
								else
								i=i+1                  # if false store new hash element
								h.store(isi, i)
							end
						end
					end	 	
				end	
				else
				puts 'Directory empty'
			end	
			else
			puts 'Directory not found!, Please entry new folder path'
		end
		#print largest_hash_key(h) #result will be "[content,occurs]"
		puts largest_hash_key(h) #result will be "content newline occurs"
	end
	def largest_hash_key(hash)
		hash.max_by{|k,v| v}		
	end	
end

# Now using above class to create objects
print "insert folder to scan ?(Examples: /www/public or c:/foldername) : "
pos = gets.chomp
object = Checksamefile. new
object.hitfile(pos)