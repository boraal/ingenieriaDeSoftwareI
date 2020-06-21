!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'balance' stamp: 'AA 6/21/2020 16:22:27'!
test01_balance_TheBalanceOfANewPortfolioIsZero
	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'balance' stamp: 'AA 6/21/2020 16:22:31'!
test02_balance_TheBalanceOfAPortfolioWithAnAccountWithouthTransactionsIsZero
	|portfolio receptiveAccount|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'balance' stamp: 'AA 6/21/2020 16:22:36'!
test03_balance_TheBalanceOfAPortfolioWithOneAccountIsAccountsBalance
	|portfolio receptiveAccount|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	portfolio add: receptiveAccount.
	self assert: 100 equals: portfolio balance .! !

!PortfolioTest methodsFor: 'balance' stamp: 'AA 6/21/2020 16:22:41'!
test04_balance_TheBalanceOfAPortfolioWithMultipleAccountsIsTheSumOfTheAccountsBalance
	|portfolio receptiveAccount receptiveAccount2|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	portfolio add: receptiveAccount.
	portfolio add: receptiveAccount2.
	self assert: 200 equals: (portfolio balance).! !

!PortfolioTest methodsFor: 'balance' stamp: 'AA 6/21/2020 16:22:45'!
test05_balance_ThebalanceOfAPortfolioWithAPortfolioIsTheBalanceOfThePortfolio
	|portfolio  portfolio2 receptiveAccount|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	portfolio add: portfolio2.
	portfolio2 add: receptiveAccount.

	self assert: 100 equals: (portfolio balance).! !

!PortfolioTest methodsFor: 'balance' stamp: 'AA 6/21/2020 16:22:49'!
test06_balance_TheBalanceOfAPortfolioUpdatesWhenNewTransactionsAreDoneIsTheirAccounts
	|portfolio receptiveAccount|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount.
	Deposit register: 100 on: receptiveAccount.
	self assert: 100 equals: portfolio balance .! !


!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/21/2020 16:24:40'!
test01_Register_AnEmptyPortfolioDoesntRegisterTransactionsFromAccounts
	|portfolio receptiveAccount deposit|
	
	portfolio := Portfolio new.
	receptiveAccount  := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount . 
	self deny: (portfolio hasRegistered: deposit ).
	! !

!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/21/2020 16:23:42'!
test02_Register_APortfolioRegisterTransactionsInAccountInsideIt
	|portfolio receptiveAccount deposit|
	
	portfolio := Portfolio new.
	receptiveAccount  := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount . 
	portfolio add: receptiveAccount.
	self assert: (portfolio hasRegistered: deposit ).
	! !

!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/21/2020 16:24:46'!
test03_Register_APortfolioDoesntRegisterTransactionsFromAccountsThatAreNotInPortfolio
	|portfolio receptiveAccountWithDeposit deposit receptiveAccountWithoutDeposit|
	
	portfolio := Portfolio new.
	receptiveAccountWithDeposit  := ReceptiveAccount new.
	receptiveAccountWithoutDeposit := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccountWithDeposit . 
	portfolio add: receptiveAccountWithoutDeposit.
	self deny: (portfolio hasRegistered: deposit ).
	! !

!PortfolioTest methodsFor: 'register account ' stamp: 'AA 6/21/2020 16:25:40'!
test04_Register_APortfolioRegistersAllTransactionsInItsAccounts
	|portfolio receptiveAccountWithDeposit deposit receptiveAccountWithoutDeposit|
	
	portfolio := Portfolio new.
	receptiveAccountWithDeposit  := ReceptiveAccount new.
	receptiveAccountWithoutDeposit := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccountWithDeposit . 
	portfolio add: receptiveAccountWithoutDeposit.
	portfolio add: receptiveAccountWithDeposit .
	self assert: (portfolio hasRegistered: deposit ).
	! !


!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/21/2020 16:26:32'!
test01_Transaction_ANewPortfolioDoesntHaveTransactions
	|portfolio |
	portfolio := Portfolio new.
	self assert: 0 equals: portfolio transactions size.! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/21/2020 16:26:58'!
test02_Transaction_APortfoliowithOneAccountOneTransactionHasOneTransaction
	|portfolio receptiveAccount|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	portfolio add: receptiveAccount.
	self assert: 1 equals: portfolio transactions size.! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/21/2020 16:27:54'!
test03_Transaction_APortofolioWithOneAccountWithOneTransactionHasThatTransaction
	|portfolio receptiveAccount deposit|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount.
	portfolio add: receptiveAccount.
	self assert: (portfolio transactions includes:  deposit).! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/21/2020 16:29:05'!
test04_Transaction_APortfolioHasAllTransactionsInAPortfolioInsideIt
	|portfolio portfolio2 receptiveAccount deposit|
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: receptiveAccount.
	portfolio2 add: receptiveAccount.
	portfolio add: portfolio2 .
	self assert: (portfolio transactions includes: deposit).! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/21/2020 16:30:13'!
test05_Transaction_APortfolioUpdatesItsTransactionsAfterATransactionIsDoneInOneOfItsAccounts
	|portfolio receptiveAccount deposit|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount.
	deposit := Deposit register: 100 on: receptiveAccount.
	self assert: (portfolio transactions includes:  deposit).! !

!PortfolioTest methodsFor: 'transactions' stamp: 'AA 6/21/2020 16:31:06'!
test06_Transaction_APortfolioRegistersMoreThanOneTransactionFromTheSameAccount
	|portfolio receptiveAccount deposit deposit2|
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount.
	deposit := Deposit register: 100 on: receptiveAccount.
	deposit2 := Deposit register: 100 on: receptiveAccount.

	self assert: (portfolio transactions includes:  deposit).
	self assert: (portfolio transactions includes:  deposit2).! !


!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:32:58'!
test01_Add_APortfolioCantAddAnAlreadyAddedAccount
	|portfolio receptiveAccount|
	
	portfolio := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: receptiveAccount .
	

	self should: [portfolio add: receptiveAccount ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:33:49'!
test02_Add_APortfolioCantAddAnAccountThatAlreadyIsInAPortfolioInsideIt
	|portfolio  portfolio2 receptiveAccount|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: portfolio2.
	portfolio2 add: receptiveAccount.

	self should: [portfolio add: receptiveAccount ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:35:48'!
test03_Add_APortfolioCantAddAnAccountThatIsInAPortfolioPortfolios
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

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:36:23'!
test04_Add_APortfolioCantAddSamePortfolioMoreThanOnce
	|portfolio  portfolio2|
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.

	portfolio add: portfolio2.

	self should: [portfolio add: portfolio2 ]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:37:09'!
test05_Add_APortfolioCantAddAPortfolioInWhichItIsIncluded
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

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:38:03'!
test06_Add_APortfolioThatIsInsideMultiplePortfoliosCantAddAnyOfThosePortfolios
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

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:40:41'!
test07_Add_APortfolioCantAddAPortfolioThatIsIncludedInAPortfolioThatIncludesItsSelf
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

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:41:09'!
test08_Add_APortfolioCantAddItSelf
	|portfolio|
	
	portfolio := Portfolio new.


	self should: [portfolio add: portfolio ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:41:55'!
test09_Add_APortfolioCantAddAnAccountThatIsIncludedInAPortfolioThatIncludesItsSelf
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

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:43:02'!
test10_Add_APortfolioCantAddAPortfolioThatIncludesOneOfItsPortfolios
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

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:44:25'!
test11_Add_APortfolioCantAddAPortfolioThatIncludesOneOfTheAccountsIncludedInOneOfThePortfoliosInItsSelf
	|portfolio portfolio2 portfolio3 receptiveAccount  |
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: portfolio2 .
	portfolio2 add: receptiveAccount .
	portfolio3 add: receptiveAccount .

	self should: [portfolio add: portfolio3 ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:45:03'!
test12_Add_APortfolioCantAddAPortfolioThatHasAnAccountInCommon
	|portfolio portfolio2 portfolio3 receptiveAccount  |
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	receptiveAccount := ReceptiveAccount new.
	portfolio add: portfolio2 .
	portfolio2 add: receptiveAccount .
	portfolio3 add: receptiveAccount .

	self should: [portfolio3 add: portfolio ]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: Portfolio cantRepeatePortfoliosAndAccountsErrorDescription]! !

!PortfolioTest methodsFor: 'add' stamp: 'AA 6/21/2020 16:46:04'!
test13_Add_APortfolioCantAddAPortfolioThatHasAPortfolioThatIncludesItSelf
	|portfolio portfolio2 portfolio3  |
	
	portfolio := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.

	portfolio add: portfolio2 .
	portfolio2 add: portfolio3 .
	

	self should: [portfolio3 add: portfolio ]
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
	instanceVariableNames: 'aSetOfAccount portfoliosInWhichItIsIncluded'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'transactions registered' stamp: 'AA 6/20/2020 15:44:46'!
balance
	^aSetOfAccount sum: [:anAccountOrPortfolio | anAccountOrPortfolio  balance] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'transactions registered' stamp: 'AA 6/20/2020 16:31:12'!
hasRegistered: aTransaction 
	^aSetOfAccount inject: false into: [:transactionIsInPorfolio :accounts | transactionIsInPorfolio or: (accounts hasRegistered: aTransaction)]! !

!Portfolio methodsFor: 'transactions registered' stamp: 'AA 6/21/2020 15:53:12'!
transactions
	|transactionIsInPorfolio|
	transactionIsInPorfolio := OrderedCollection new.
	aSetOfAccount do: [:accounts | transactionIsInPorfolio addAllLast: (accounts transactions )].
	
	^transactionIsInPorfolio .! !


!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/21/2020 16:53:07'!
add: aPortfolioOrAccount
	self errorIfThereAreRepeteadedAccountsOrPortfoliosWith: aPortfolioOrAccount.
	aPortfolioOrAccount addPortfolioInWhichItIsIncluded: self.	
	aSetOfAccount add: aPortfolioOrAccount .
	
	! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/21/2020 16:53:07'!
addPortfolioInWhichItIsIncluded: aPortfolio 
	portfoliosInWhichItIsIncluded add: aPortfolio.! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/21/2020 16:52:35'!
errorIfAccountOrPortfolios: includedAccountsAndPortfolios areRepeatedIn: aPortfolioOrAccount

	^ aPortfolioOrAccount includedAccountsAndPortfolios do: 
		[
			:nonIncludedAccount |
			(includedAccountsAndPortfolios includes: nonIncludedAccount)  ifTrue:
			[
				self error: self class cantRepeatePortfoliosAndAccountsErrorDescription
			]
					
		]! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/21/2020 16:52:57'!
errorIfThereAreRepeteadedAccountsOrPortfoliosWith: aPortfolioOrAccount
	|includedAccountsAndPortfolios|
	includedAccountsAndPortfolios  := self includedAccountsAndPortfolios.
	self errorIfAccountOrPortfolios: includedAccountsAndPortfolios areRepeatedIn: aPortfolioOrAccount.
	portfoliosInWhichItIsIncluded do:
	[
		:parent |
		includedAccountsAndPortfolios  := parent includedAccountsAndPortfolios.
		self errorIfAccountOrPortfolios: includedAccountsAndPortfolios areRepeatedIn: aPortfolioOrAccount.
	]
	
		

	
	

		
! !

!Portfolio methodsFor: 'add acount or portfolio' stamp: 'AA 6/21/2020 16:50:28'!
includedAccountsAndPortfolios
	
	|collection|
	collection := OrderedCollection new.
	collection add: self.
	 aSetOfAccount do: 
	[:anAccountOrPortfolioInPortfolio |
		(anAccountOrPortfolioInPortfolio includedAccountsAndPortfolios) do: [:account | collection add: account ].
	].

	^collection.
		! !


!Portfolio methodsFor: 'initialization' stamp: 'AA 6/21/2020 16:46:32'!
initialize
	aSetOfAccount := OrderedCollection new.
	portfoliosInWhichItIsIncluded := OrderedCollection new.

! !


!Portfolio methodsFor: 'testing' stamp: 'AA 6/20/2020 17:05:23'!
accounts
	^aSetOfAccount 
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
	instanceVariableNames: 'transactions portfoliosInWhichItIsIncluded'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AA 6/21/2020 16:47:25'!
initialize

	transactions := OrderedCollection new.
	portfoliosInWhichItIsIncluded := OrderedCollection new.! !


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


!ReceptiveAccount methodsFor: 'testing' stamp: 'AA 6/20/2020 14:56:36'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'portfolio ' stamp: 'AA 6/21/2020 16:53:07'!
addPortfolioInWhichItIsIncluded: aPortfolio 
	portfoliosInWhichItIsIncluded add: aPortfolio.! !

!ReceptiveAccount methodsFor: 'portfolio ' stamp: 'AA 6/21/2020 16:50:27'!
includedAccountsAndPortfolios
	|collection|
	collection  := OrderedCollection new.
	collection add: self.
	^collection .! !
