require "spec_helper"

describe CurrencyConversion do
   context "#change_for" do

      it "should say 'Hello World' when we call the say_hello method" do
         cc = CurrencyConversion.new
         message = cc.change_for
         expect(message).to eq "Inside change_for method!!"
      end
   end
end
