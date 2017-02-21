# table of contents

line_width = 60
header = "Table of Contents"
chapter_1 = "Chapter 1: Getting Started"
chapter_1_page = "page 1"
chapter_2 = "Chapter 2: Numbers"
chapter_2_page = "page 9"
chapter_3 = "Chapter 3: Letters"
chapter_3_page = "page 13"

table_of_contents = [header, chapter_1, chapter_1_page, chapter_2,
                    chapter_2_page, chapter_3, chapter_3_page]

puts table_of_contents[0].center(line_width)
puts table_of_contents[1].ljust(line_width/2) + table_of_contents[2].rjust(line_width/2)
puts table_of_contents[3].ljust(line_width/2) + table_of_contents[4].rjust(line_width/2)
puts (table_of_contents[5].ljust(line_width/2) + table_of_contents[6].rjust(line_width/2))
