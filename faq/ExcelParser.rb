require 'spreadsheet'

spreadsheet = ARGV[0] || 'list.xls'
book = Spreadsheet.open spreadsheet #cant parse xlsx files, need old file type
sheet1 = book.worksheet 0
html = File.new('list.html', 'w+')
odd_row_counter = 0 #track odd rows. the spreadsheet actually starts on an odd row, so im tracking this separately....

html.syswrite("<table>\n")
html.syswrite("\t<tr class=\"table_headers\">\n")
html.syswrite("\t\t<td>GAME TITLE</td>\n")
html.syswrite("\t\t<td>PUBLISHER</td>\n")
html.syswrite("\t</tr>\n")

sheet1.each 11 do |row| #the 11 specifies that we will skip the first 11 rows in the spreadsheet, which is handy
  if odd_row % 2 == 0
    html.syswrite("\t<tr>\n")
  else
    html.syswrite("\t<tr class=\"odd_row\">\n")
  end
  #row[2] is the title, row[3] is the publisher, row[54] is the link to the itunes store. This could all change at anytime...
  html.syswrite("\t\t<td><a href=\"#{row[54]}\">#{row[2]}</a></td>\n")
  html.syswrite("\t\t<td>#{row[3]}</td>\n")
  html.syswrite("\t</tr>\n")
    
  odd_row_counter += 1
end

html.syswrite("</table>\n")

html.close