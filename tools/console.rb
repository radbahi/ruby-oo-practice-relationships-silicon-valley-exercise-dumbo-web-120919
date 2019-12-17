require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("StartupName!", "Startup guY!", "sTARTUP.com")
s2 = Startup.new("COMPETITOR", "COMP GUY", "COMP.COM")
s1.sign_contract("big banks GUY!", "Seed", 999)
s1.sign_contract("bigger banks GUY!", "Seed", 9999999999999)

v1 = VentureCapitalist.new("Philip Banks", 9999999999999999)

s1.sign_contract(v1, "Seed", 999999999999)
s2.sign_contract(v1, "Seed", 2)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line