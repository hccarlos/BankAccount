class BankAccount
	@accountNumber
	@checkingBalance
	@savingBalance
	@interestRate
	@@numOfCustomers = 0

	attr_reader :accountNumber, :checkingBalance, :savingBalance

	def initialize()
		@accountNumber = randomAccountNumber
		@checkingBalance = 0
		@savingBalance = 0
		@interestRate = '3.3%'
		@@numOfCustomers += 1
	end

	def deposit acct, amount

		if acct == 'checking'
			@checkingBalance += amount
		elsif acct == 'saving'
			@savingBalance += amount
		else
			puts 'no such account'
		end
		return self
	end ## function end

	def withdraw acct, amount
		if acct == 'checking'
			if amount <= @checkingBalance
				@checkingBalance -= amount
			else
				puts 'insufficient funds'
			end
		elsif acct == 'saving'
			if amount <= @savingBalance
				@savingBalance -= amount
			else
				puts 'insufficient funds'
			end
		else
			puts 'no such account'
		end
		return self
	end ## function end

	def total_funds
		puts @checkingBalance+@savingBalance
	end

	def account_information
		puts "account number: #{@accountNumber}"
		print "total funds: "
		total_funds
		puts "checking account balance: #{@checkingBalance}"
		puts "saving account balance: #{@savingBalance}"
		puts "interest rate: #{@interestRate}"
	end


#################### class methods
	def self.numOfCustomers
		puts @@numOfCustomers
	end
####################

#################### private area
	private
	def randomAccountNumber
		str = ""
		5.times {str<<(65+rand(26)).chr}
		str
	end

####################

end # end for class

myAccount1 = BankAccount.new
myAccount1.deposit 'checking', 10
puts myAccount1.checkingBalance



# myAccount1.deposit 'checking', 10
# myAccount1.withdraw 'checking', 10
# myAccount1.deposit 'saving', 4
# myAccount2 = BankAccount.new
# myAccount3 = BankAccount.new
# myAccount1.total_funds
# BankAccount.numOfCustomers
# myAccount1.account_information
