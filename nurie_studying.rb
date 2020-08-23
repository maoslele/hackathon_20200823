content = 0
time = 0
squares = 0

def input_status
  puts "今日はどの項目を何分勉強した？？"
  print "学習項目を入力 ＞ "
  content = gets.chomp
  print "学習時間を入力 ＞ "
  time = gets.chomp.to_i
  return content, time
end

def calc_squares(time)
  squares = (time.to_f / 15).floor
  return squares
end

def show_status(content, squares)
  puts ""
  puts "学習記録"
  puts ""
  print "#{content} "
  squares.times {|square| print "■"}
  puts ""
end

content, time = input_status()
squares = calc_squares(time)
show_status(content, squares)