require_relative 'app'

class CLI
  def run
    puts "The default IP address to seed is 8.8.8.8."
    puts "If you'd like to use another, enter it now (or press enter to continue):"
    ip = gets.chomp

    arg = ip.empty? ? nil : ip
    print App.new(arg).run
    print "\n"
  end
end

CLI.new.run
