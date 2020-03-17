# Procs and blocks

toast = Proc.new do |good_stuff|
	puts "I really like #{good_stuff}"
end

toast.call 'chocolate'
