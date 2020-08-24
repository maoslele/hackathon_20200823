require 'colorize'

def update_logs(input_subject, input_minutes, study_logs)
  input_subject.downcase!
  if study_logs.has_key?(input_subject)
    study_logs.store(input_subject, input_minutes+=input_minutes)
  else
    study_logs.store(input_subject, input_minutes)
  end
end

def print_logs(study_logs)
  puts "\n********学習記録********"
  study_logs.each {|subject, minutes|
    squares = ""
    (minutes / 15).times {
      squares << "■"
    }
    puts "#{subject}：#{squares.green}"
  }
  puts "************************"
end

def main
  study_logs = {}

  while true do
    input_subject = nil
    input_minutes = nil

    puts "今日はどの項目を何分勉強した？？"
    print "学習項目を入力 ＞ "
    input_subject = gets.chomp
    print "学習時間を入力(単位：分) ＞ "
    input_minutes = gets.chomp.delete("^0-9").to_i #.delete("^0-9")で0-9以外の入力値を自動削除

    update_logs(input_subject, input_minutes, study_logs)
    print_logs(study_logs)

    puts "\n続けて入力しますか？(Y/Nを入力)"
    continue = gets.chomp
    continue.upcase!
    return if continue == "N"

  end

end

main