require_relative 'app'

class CLI
  def run
    puts "The default IP address to seed is 8.8.8.8."
    puts "If you'd like to use another, enter it now (or press enter to continue):"
    ip = gets.chomp

    if ip.empty?
      puts 'Using default ip.'
    else
      puts "The ip you entered was #{ip}"
    end

    arg = ip.empty? ? nil : ip
    print App.new(arg).run
  end
end

CLI.new.run
