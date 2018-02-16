require "spec_helper"
require 'stringio'

def get_user_inputs
  $stdin.gets.chomp
end

describe 'CurrencyConversion' do
  context '#get_user_inputs' do
    before do
      $stdin = StringIO.new("41\n")
    end

    after do
      $stdin = STDIN
    end

    it "should get user inputs" do
      expect(get_user_inputs).to be == '41'
    end
  end

  context '#change_for_basic' do
    before do
      @cc = CurrencyConversion.new
    end

    it "should be amount to convert to desired currency format" do
      expect { @cc.change_for_basic(25) }.to output("1 Quarters, 0 Dimes, 0 Nickels and 0 Pennies\n").to_stdout
    end

    it "should be amount to convert to desired currency format" do
      expect { @cc.change_for_basic(41) }.to output("1 Quarters, 1 Dimes, 1 Nickels and 1 Pennies\n").to_stdout
    end
  end

  context '#change_for' do
    before do
      @cc = CurrencyConversion.new
    end

    it "should be amount to convert to desired currency format" do
      expect { puts @cc.change_for(41) }.to output(/{"Quarters"=>1, "Dimes"=>1, "Nickels"=>1, "Pennies"=>1}/).to_stdout
    end
  end
end