#Musicbox

#methods:
#1) play music
#2) pay
#3) search
#4) turn on/off
#5) load song

#properties:
#1) songs [array]
#2) cost
#3) current song
#4) status
#require 'debugger'

class Musicbox
  
  attr_reader :song_cost

  def initialize (song_cost)
  @songs = ['Hit #1', 'Hit #2', 'Hit #3', 'Hit #4', 'Hit #5']
  @song_cost = song_cost
  @current_song = 'nothing'
  @turned_on = false
  @balance = 0
  end

  def play_music
    if @turned_on
      if @balance - @song_cost <= @balance && @balance - @song_cost >= 0
        puts 'List:'
        @counter = 1
        @songs.each do |x|
                    puts "#{@counter}. #{x}"
                    @counter += 1
                    end
        puts 'Enter song number in the list your wanna play?'
        choice = gets.chomp
        @current_song = @songs[choice.to_i - 1]
        @balance -= @song_cost
        puts "Playing #{@songs[choice.to_i - 1]}."
        puts "Your balance is #{@balance}"
      else
        puts "Not enough balance. Please, pay for music."
      end
    else
      puts "Turn on #{self}"
    end
  end

  def load_song (song)
    if @turned_on
      @songs << song
      puts "Song #{@songs[-1]} was added."
    else
      puts "Turn on #{self}"
    end  
  end

  def pay (income_money)
    if @turned_on
      @balance += income_money
    else
      puts "Turn on #{self}"
    end
  end

  def turn_on
  if @turned_on == false
    @turned_on = true
    puts "#{self} was turned on"
  else
    puts 'Already on'
  end
  end

  def turn_off
    if @turned_on == true
    @turned_on = false
    puts "#{self} was turned off"
    else
    puts 'Already off'
    end
  end

  def search (song_name)
    if @turned_on
      puts @songs.include?(song_name) ? "#{song_name} is in the list" : 'There\'s no such song.'
    else
      puts "Turn on #{self}"
    end
  end

  def status
    puts @turned_on ? "Turned on #{self}" : "Turned off #{self}"
    puts "Playing: #{@current_song}"
  end
end

class CDBox < Musicbox
  def load_song (song)
    puts "Insert CD disk"
    super
  end
end

class CassetteBox < Musicbox
  def load_song (song)
    puts "Insert Cassette tape"
    super
  end
end

musicbox = Musicbox.new 10
musicbox.turn_on
musicbox.status
musicbox.turn_on
musicbox.turn_off
musicbox.status
puts musicbox.song_cost
musicbox.turn_on
musicbox.pay 20
musicbox.load_song 'Yesterday by Beetles'
3.times { musicbox.play_music }
musicbox.search 'Yesterday by Beetles'


cdbox = CDBox.new 20
cdbox.status
cdbox.turn_on
puts cdbox.song_cost
cdbox.pay 20
cdbox.load_song 'Yesterday by Beetles'
3.times { cdbox.play_music }
cdbox.search 'Yesterday by Beetles'
cdbox.turn_off
  

cassettebox = CassetteBox.new 5
cassettebox.status
cassettebox.turn_on
puts cassettebox.song_cost
cassettebox.pay 20
cassettebox.load_song 'Yesterday by Beetles'
3.times { cassettebox.play_music }
cassettebox.search 'Yesterday by Beetles'
cassettebox.turn_off
