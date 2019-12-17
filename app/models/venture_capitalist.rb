require_relative './startup'
require_relative './funding_round'

class VentureCapitalist
attr_reader :name, :total_worth
@@all = []

def initialize(name, total_worth)
@name = name
@total_worth = total_worth
@@all << self
end




def self.tres_comma_club
@@all.each do |allVentures|
allVentures if allVentures.total_worth > 1_000_000_000
end
end



def offer_contract(startup, type, investment)
FundingRound.new(startup, self, type, investment)
end


def funding_rounds
FundingRound.all.select do |theInvestors|
theInvestors.venture_capitalist == self
end
end

def portfolio
Startup.all.each do |uniqueList|
    uniqueList.investors.uniq == self
end
end

def biggest_investment
investment_amount = 0
    funding_rounds.each do |bigI|
if bigI.investment > investment_amount
    investment_amount = bigI.investment
end
end
investment_amount
end

def self.all
@@all
end



def investment(domainName)
total = 0
FundingRound.all.each do |domainFind|
if domainFind.startup.domain == domainName
    total += domainFind.investment
end
end
total
end

end