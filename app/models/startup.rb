require_relative './funding_round'
require_relative './venture_capitalist'

class Startup
attr_reader :founder
attr_accessor :name, :domain

@@all = []


def initialize(name, founder, domain)
  @name = name
  @founder = founder
  @domain = domain
  @@all << self
  end
  
  def pivot(name, domain)
    @name = name
    @domain = domain
  end
  
  def self.all
    @@all
  end
  
  def find_by_founder(founderName)
    @@all.find do |startUp|
    startUp.founder == founderName
  end
end
  
  def domains
    @@all.select do |allStartups|
    allStartups.domain
  end
  end
  
  def sign_contract(venture_captalist, type_of_investment, investment_amount)
  FundingRound.new(self, venture_captalist, type_of_investment, investment_amount)
end

def num_funding_rounds
  total = 0 
  FundingRound.all.each do |fundingRoundTotal|
    if fundingRoundTotal.startup == self
        binding.pry
      total += 1 
    end
end
total
end

def total_funds
  total = 0
  FundingRound.all.each do |fundingRoundTotal|
    if fundingRoundTotal.startup == self
      total += fundingRoundTotal.investment
    end
end
total
end

def investors
investors = []
FundingRound.all.each do |fundingRoundInvestors|
    if fundingRoundInvestors.startup == self
      investors << fundingRoundInvestors.venture_capitalist
    end
end
investors
end

def big_investors
bigInvestors = []
VentureCapitalist.tres_comma_club.each do |bigboys|
    if bigboys == self.investors
        bigInvestors << bigboys
    end
    bigInvestors
end
end

end # end of class
