require 'sqlite3'

def tele_gram(phone_num)
	words_1 = [phone_num[0..2]]
	words_2 = [phone_num[3..5]]
	words_3 = [phone_num[6..9]]
	@db = SQLite3::Database.new("dict.db")
	words_1 += @db.execute("SELECT word FROM words WHERE num = #{phone_num[0..2]}").flatten
	words_2 += @db.execute("SELECT word FROM words WHERE num = #{phone_num[3..5]}").flatten
	words_3 += @db.execute("SELECT word FROM words WHERE num = #{phone_num[6..9]}").flatten
	p words_1
	p words_2
	p words_3
	p words_1.sample + '-' +  words_2.sample + '-' + words_3.sample
end

tele_gram('3859687448')

 # str_arr = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('')
 # str_arr.reduce(''){|res,let| res + '"' + let.downcase + '"' + '=>' + '"' +'0' + '"' + ','}

 # letters  = {"A"=>"2","B"=>"2","C"=>"2","D"=>"3","E"=>"3","F"=>"3","G"=>"4","H"=>"4","I"=>"4","J"=>"5","K"=>"5","L"=>"5","M"=>"6","N"=>"6","O"=>"6","P"=>"7","Q"=>"7","R"=>"7","S"=>"7","T"=>"8","U"=>"8","V"=>"8","W"=>"9","X"=>"9","Y"=>"9","Z"=>"9","a"=>"2","b"=>"2","c"=>"2","d"=>"3","e"=>"3","f"=>"3","g"=>"4","h"=>"4","i"=>"4","j"=>"5","k"=>"5","l"=>"5","m"=>"6","n"=>"6","o"=>"6","p"=>"7","q"=>"7","r"=>"7","s"=>"7","t"=>"8","u"=>"8","v"=>"8","w"=>"9","x"=>"9","y"=>"9","z"=>"9"}
 




def word_to_num(word)
	num = ''
	letters  = {"A"=>"2","B"=>"2","C"=>"2","D"=>"3","E"=>"3","F"=>"3","G"=>"4","H"=>"4","I"=>"4","J"=>"5","K"=>"5","L"=>"5","M"=>"6","N"=>"6","O"=>"6","P"=>"7","Q"=>"7","R"=>"7","S"=>"7","T"=>"8","U"=>"8","V"=>"8","W"=>"9","X"=>"9","Y"=>"9","Z"=>"9","a"=>"2","b"=>"2","c"=>"2","d"=>"3","e"=>"3","f"=>"3","g"=>"4","h"=>"4","i"=>"4","j"=>"5","k"=>"5","l"=>"5","m"=>"6","n"=>"6","o"=>"6","p"=>"7","q"=>"7","r"=>"7","s"=>"7","t"=>"8","u"=>"8","v"=>"8","w"=>"9","x"=>"9","y"=>"9","z"=>"9"}
	i = 0 
	while i < word.length
		num += letters[word[i]]
		i += 1
	end
	num 
end

 # p word_to_num("akz")

def txt_to_hash_parser(filename)
	num_hash = {}
  file_arr = []
  @db = SQLite3::Database.new("dict.db")
  File.open(filename, mode = "r").each_line do |line|
    line.gsub!("\n",'')
    next if line == "" 
    num = word_to_num(line)
    @db.execute("INSERT INTO words (word,num) values (?,?)",[line,num])
    file_arr << line
  end
  file_arr
end

# txt_to_hash_parser('new_dict.txt')



# def parse_text(filename)
#   file_arr = []
#   # f = File.new("new_dict.txt", "w+")
#   File.open(filename, mode = "r").each_line do |line|
#     line.gsub!("\n",'')
#     next if line == "" 
#     # 	|| line.length > 10
#     # 	next
#     # end
#     # f.puts(line)
#     file_arr << line
#   end
#   file_arr
# end

# parse_text('dict.txt')