class Slots
  def initialize(player)
    puts '
  /$$$$$$  /$$             /$$
 /$$__  $$| $$            | $$
| $$  \__/| $$  /$$$$$$  /$$$$$$   /$$$$$$$
|  $$$$$$ | $$ /$$__  $$|_  $$_/  /$$_____/
 \____  $$| $$| $$  \ $$  | $$   |  $$$$$$
 /$$  \ $$| $$| $$  | $$  | $$ /$$\____  $$
|  $$$$$$/| $$|  $$$$$$/  |  $$$$//$$$$$$$/
 \______/ |__/ \______/    \___/ |_______/ '.colorize(:yellow)
    puts "Welcome to slots #{player.name}!"
    puts "You have #{player.wallet.amount}"
    slots(player)
  end

  def slots(player)
    slot1 = ["Cherries", "777", "Bell"]
    slot2 = ["Cherries", "777", "Bell"]
    slot3 = ["Cherries", "777", "Bell"]
    puts "How much would you like to bet?"
    betting_amount = gets.to_f
      if betting_amount > player.wallet.amount || betting_amount < 1
        puts "You don't have enough cash!"
        slots(player)
      end
    puts "Type 'Spin' to pull the handle or type 'Menu' to return to the main menu"
    case gets.strip.downcase
    when "spin"
      slot_roll_one = slot1.sample
      slot_roll_two = slot2.sample
      slot_roll_three = slot3.sample
      puts slot_roll_one.colorize(:yellow)
      puts slot_roll_two.colorize(:green)
      puts slot_roll_three.colorize(:cyan)
      if slot_roll_one == slot_roll_two && slot_roll_two == slot_roll_three
        player.wallet.amount += betting_amount
        puts "You win! Current balance #{player.wallet.amount}".colorize(:green)
      else
        player.wallet.amount -= betting_amount
        puts "You lose! Current balance #{player.wallet.amount}".colorize(:red)
      end
    when "menu"
    end
  end
end
