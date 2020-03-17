# Picture downloading
Dir.chdir 'C:/Documents and Settings/Katy/PictureInbox'
pic_names = Dir['F:/**/*.jpg']
puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts
print "Downloading #{pic_names.length} files: "
pic_number = 1
pic names.each do |name|
	print '.' # Progress bar
	new_name = if pic_number < 10
		"{batch_name}0#{pic_number}.jpg"
	else
		"#{batch_nane}#{pic_number}.jpg"
	end
	File.rename name, new_name
	pic_number = pic_number + 1
end
puts # This is so we aren't on progress bar line.
puts 'Done'
