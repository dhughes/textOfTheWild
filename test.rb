require 'io/console'
require 'pry'
# console = IO.console

@char = ''

def show(str)
  # Once has a STDIN.getch loop running (listen_keyboard) my console goes into raw mode.
  # Print strings in raw mode is such a bad idea.
  # So this method turns the raw mode off temporarily.
  #system "stty -raw echo"
  IO.console.cooked!
  puts str
  IO.console.raw!
  # system "stty raw -echo"
end

def quit
  IO.console.cooked!
  exit
end

def listen_keyboard
  loop do
    @char = STDIN.getch
    show(@char) if @char

    if @char == "q"
      quit
    elsif @char == 'z'
      binding.pry
    end
  end
end

def print_screen_size
  loop do

    show(IO.console.winsize.inspect)

    sleep(1)
  end
end

t1 = Thread.new { listen_keyboard }
t2 = Thread.new { print_screen_size }

t1.join