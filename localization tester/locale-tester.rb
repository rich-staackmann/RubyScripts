#this small script will check all the language files of SSE for any null strings
#when a string has no value it will appear as UNDEFINED in SSE
#the locales array holds all the languages that SSE currently supports
#WARNING: This script works with an installed version of SSE(not dev env) on any 64bit windows OS, 
#         I have not generalized it yet
file_path = ARGV[0] || "C:\\Program Files\\SteelSeries\\SteelSeries Engine 3\\Localization\\"
locales = [ 'de', 'en_US', 'es', 'fr', 'it', 'ja', 'ko', 'ltr', 'pt', 'pt_br', 'ru_RU', 'zh_hans', 'zh_hant' ]

locales.each do | lang |
  json = File.open(file_path + "#{lang}.json", 'r')
  
  json.each do | line |
    if ( /UNDEFINED/.match(line) || /undefined/.match(line) || /"\s*"/.match(line) ) #check for undefined or empty string
      puts line.strip + "\t" + json.path[62..-1] #62 is the index of all the useless characters from the file path
    end
  end
  json.close
end