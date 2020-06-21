!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 15:15:49'!
test01
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 15:17:27'!
test02
	|portfolio receptiveAccount|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 15:23:36'!
test03
	|portfolio receptiveAccount|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	portfolio add: receptiveAccount.
	self assert: 100 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 15:28:22'!
test04
	|portfolio receptiveAccount receptiveAccount2|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	portfolio add: receptiveAccount.
	portfolio add: receptiveAccount2.
	self assert: 200 equals: (portfolio balance).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 15:34:10'!
test05
	|portfolio  portfolio2 receptiveAccount|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	portfolio add: portfolio2.
	portfolio2 add: receptiveAccount.

	self assert: 100 equals: (portfolio balance).! !

!PortfolioTest methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 15:51:36'!
test06
	|portfolio receptiveAccount|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount.
	Deposit register: 100 on: receptiveAccount.
	self assert: 100 equals: portfolio balance .! !


!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/20/2020 16:20:58'!
test07
	|portfolio receptiveAccount deposit|
	
	portfolio := Portfolio new.
	receptiveAccount  := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount . 
	self deny: (portfolio hasRegistered: deposit ).
	! !

!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/20/2020 16:23:04'!
test08
	|portfolio receptiveAccount deposit|
	
	portfolio := Portfolio new.
	receptiveAccount  := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount . 
	portfolio add: receptiveAccount.
	self assert: (portfolio hasRegistered: deposit ).
	! !

!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/20/2020 16:26:13'!
test09
	|portfolio receptiveAccountWithDeposit deposit receptiveAccountWithoutDeposit|
	
	portfolio := Portfolio new.
	receptiveAccountWithDeposit  := ReceptiveAccount new.
	receptiveAccountWithoutDeposit := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccountWithDeposit . 
	portfolio add: receptiveAccountWithoutDeposit.
	self deny: (portfolio hasRegistered: deposit ).
	! !

!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/20/2020 16:32:14'!
test10
	|portfolio receptiveAccountWithDeposit deposit receptiveAccountWithoutDeposit|
	
	portfolio := Portfolio new.
	receptiveAccountWithDeposit  := ReceptiveAccount new.
	receptiveAccountWithoutDeposit := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccountWithDeposit . 
	portfolio add: receptiveAccountWithoutDeposit.
	portfolio add: receptiveAccountWithDeposit .
	self assert: (portfolio hasRegistered: deposit ).
	! !


!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/20/2020 16:34:40'!
test11
	|portfolio |
	portfolio := Portfolio new.
	self assert: 0 equals: portfolio transactions size.! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/20/2020 16:41:53'!
test12
	|portfolio receptiveAccount|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	portfolio add: receptiveAccount.
	self assert: 1 equals: portfolio transactions size.! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/20/2020 16:55:59'!
test13
	|portfolio receptiveAccount deposit|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount.
	portfolio add: receptiveAccount.
	self assert: deposit equals: (portfolio transactions at:1).! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/20/2020 16:55:36'!
test14
	|portfolio portfolio2 receptiveAccount deposit|
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount.
	portfolio2 add: receptiveAccount.
	portfolio add: portfolio2 .
	self assert: deposit equals: (portfolio transactions at: 1).! !


!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:35:05'!
test15
	|portfolio receptiveAccount|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount .
	

	self should: [portfolio add: receptiveAccount ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:35:05'!
test16
	|portfolio  portfolio2 receptiveAccount|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: portfolio2.
	portfolio2 add: receptiveAccount.

	self should: [portfolio add: receptiveAccount ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:35:05'!
test17
	|portfolio  portfolio2 portfolio3 receptiveAccount|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: portfolio2.
	portfolio2 add: portfolio3 .
	portfolio3 add: receptiveAccount.
	

	self should: [portfolio add: receptiveAccount ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:35:05'!
test18
	|portfolio  portfolio2|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	portfolio add: portfolio2.

	self should: [portfolio add: portfolio2 ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:35:43'!
test19
	|portfolio portfolio2|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio add: portfolio2 .
	

	self should: [portfolio2 add: portfolio ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:44:31'!
test20
	|portfolio portfolio2 portfolio3|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio add: portfolio3 .
	portfolio2  add: portfolio3.

	self should: [portfolio3 add: portfolio ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 17:49:26'!
test21
	|portfolio portfolio2 portfolio3|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio add: portfolio2 .
	portfolio  add: portfolio3.

	self should: [portfolio2 add: portfolio3 ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 18:02:59'!
test22
	|portfolio|
	
	portfolio := Portfolio new.


	self should: [portfolio add: portfolio ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 18:05:51'!
test23
	|portfolio portfolio2 receptiveAccount|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount .
	portfolio add: portfolio2 .

	self should: [portfolio2 add: receptiveAccount ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'repeated accounts and portfolios' stamp: 'AA 6/20/2020 18:14:03'!
test24
	|portfolio portfolio2 portfolio3|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio add: portfolio3 .
	portfolio2 add: portfolio3 .

	self should: [portfolio add:portfolio2  ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:54:22'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:54:33'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:54:12'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:54:46'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:54:59'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:55:11'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AA 6/20/2020 14:55:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AA 6/20/2020 15:11:19'!
balanceChange
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'AA 6/20/2020 14:55:31'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'AA 6/20/2020 14:55:40'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'AA 6/20/2020 14:55:58'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'AA 6/20/2020 15:11:19'!
balanceChange
	^value! !

!Deposit methodsFor: 'value' stamp: 'AA 6/20/2020 14:56:03'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'AA 6/20/2020 14:55:46'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'AA 6/20/2020 15:11:19'!
balanceChange
	^value negated! !

!Withdraw methodsFor: 'initialization' stamp: 'AA 6/20/2020 14:56:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'AA 6/20/2020 14:56:08'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'AA 6/20/2020 14:55:50'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'balance aSetOfAccount transactions parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'register' stamp: 'AA 6/20/2020 16:31:12'!
hasRegistered: aTransaction 
	^aSetOfAccount inject: false into: [:transactionIsInPorfolio :accounts | transactionIsInPorfolio or: (accounts hasRegistered: aTransaction)]! !


!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/20/2020 18:33:07'!
add: aPortfolioOrAccount
	self isAValidAccountOrPortfolioForPortfolio: aPortfolioOrAccount.
	aPortfolioOrAccount parentAssign: self.
	(aPortfolioOrAccount transactions) do: [:aTransaction | transactions add: aTransaction].	
	aSetOfAccount add: aPortfolioOrAccount .
	
	! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/20/2020 18:40:45'!
includedAccounts
	
	|collection|
	collection := OrderedCollection new.
	collection add: self.
	 aSetOfAccount do: 
	[:anAccountOrPortfolioInPortfolio |
		(anAccountOrPortfolioInPortfolio includedAccounts) do: [:account | collection add: account ].
	].

	^collection.
		! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/20/2020 19:02:54'!
isAValidAccountOrPortfolioForPortfolio: aPortfolioOrAccount
	|includedAccounts|
	self = aPortfolioOrAccount ifTrue: [self error: self class cantRepeatePortfoliosAndAccountsErrorDescription].
	
	"included accounts parents"
	self includedAccounts .
	includedAccounts  := self includedAccounts.
	aPortfolioOrAccount includedAccounts do: 
	[
		:nonIncludedAccount |
		(includedAccounts includes: nonIncludedAccount)  ifTrue:
		[
			self error: self class cantRepeatePortfoliosAndAccountsErrorDescription
		]
				
	].

	parents do:
	[
		:parent |
		includedAccounts  := parent includedAccounts.
		aPortfolioOrAccount includedAccounts do: 
		[
			:nonIncludedAccount |
			(includedAccounts includes: nonIncludedAccount)  ifTrue:
			[
				self error: self class cantRepeatePortfoliosAndAccountsErrorDescription
			]
					
		].
	]
	
		

	
	

		
! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/20/2020 17:45:54'!
parentAssign: aPortfolio 
	parents add: aPortfolio.! !


!Portfolio methodsFor: 'values' stamp: 'AA 6/20/2020 17:05:23'!
accounts
	^aSetOfAccount 
! !

!Portfolio methodsFor: 'values' stamp: 'AA 6/20/2020 15:44:46'!
balance
	^aSetOfAccount sum: [:anAccountOrPortfolio | anAccountOrPortfolio  balance] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'values' stamp: 'AA 6/20/2020 16:41:27'!
transactions
	^transactions .! !


!Portfolio methodsFor: 'initialization' stamp: 'AA 6/20/2020 17:45:46'!
initialize
	balance := 0.
	aSetOfAccount := OrderedCollection new.
	transactions := OrderedCollection new.
	parents := OrderedCollection new.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'AA 6/20/2020 18:00:53'!
cantRepeatePortfoliosAndAccountsErrorDescription
	^'account or portfolio already in portfolio or portfolio parent'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AA 6/20/2020 18:51:31'!
initialize

	transactions := OrderedCollection new.
	parents := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'AA 6/20/2020 14:56:19'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'AA 6/20/2020 14:56:23'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'AA 6/20/2020 15:11:19'!
balance

	^transactions sum: [ :aTransaction | aTransaction balanceChange ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'balance' stamp: 'AA 6/20/2020 18:14:47'!
parentAssign: aPortfolio 
	parents add: aPortfolio.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'AA 6/20/2020 14:56:36'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'AA 6/20/2020 18:50:11'!
includedAccounts
	|collection|
	collection  := OrderedCollection new.
	collection add: self.
	^collection .! !
