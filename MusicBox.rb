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

  def initialize song_cost
  @songs = []
  @song_cost = 10
  @current_song = ''
  @turned_on = false
  end

  def play_music
    puts 'play music'
  end

  def load_song song
  end

  def pay income_money
  end

  def turn_on
  if @turned_on == false
    @turned_on = true
    puts "Box was turned on"
  else
  	puts 'Already on'
  end
  end

  def turn_off
  	if @turned_on == true
    @turned_on = false
    puts "Box was turned off"
    else
  	puts 'Already off'
    end
  end

  def search song_name
  end

  def status
    if @turned_on
      p 'Turned on'
    else
      p 'Turned off'
    end
  end
end

 box = Musicbox.new 10
 box.turn_on
 box.status
 box.turn_on
 box.turn_off
 box.status

