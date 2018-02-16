## Main file responsible for taking user input amount,
# processing converting it into prper format and showing desired output
class CurrencyConversion

  #Taking inputs from user
  def get_user_inputs
    more = true
    while more==true
      puts "Enter non-negetive amount!"
      amount = gets.chomp
      begin
        Integer(amount)
        if amount.to_i.positive?
          puts currency_mapping_hash.merge(change_for(amount.to_i))
        else
          puts 'Please enter non-negetive amount!'
        end
      rescue ArgumentError, TypeError
        puts 'Not a number! Please enter non-negetive amount!'
      end
      #User have to enter y if he want to run it again
      puts "Do you want to enter more y/n?"
      a = gets.chomp
      if a!="y"
        #if user enters other than 'y' then making 'more' to 'False' to stop the loop. As condition in while will not be satisfied then
        more = false
      end
    end
  end

  # basic
   def change_for_basic(amount)
      qq, dm = amount.divmod(25)
      dm, pp = dm.divmod(10)
      nn, pp = pp.divmod(5)
      puts "%d Quarters, %d Dimes, %d Nickels and %d Pennies" % [qq, dm, nn, pp]
   end

  # recursive
   def change_for(amount, result={})
      return {} if amount == 0
      coin_name, divisor = get_divisor(amount)
      quotient, modulus = amount.divmod(divisor)
      result[coin_name] = quotient
      change_for(modulus, result) if quotient > 0
      result
   end

  private
   def get_divisor(divisor)
    case divisor
    when  1..4
      return 'Pennies', 1
    when 5..9
      return 'Nickels', 5
    when 10..24
      return 'Dimes', 10
    else
      return 'Quarters', 25
    end
   end

   def currency_mapping_hash
    {
      'Quarters' => 0,
      'Dimes' => 0,
      'Nickels' => 0,
      'Pennies' => 0
      }
   end
end

cc = CurrencyConversion.new
cc.get_user_inputs
