!classDefinition: #AccountSummaryTest category: #Portfolio2!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountSummaryTest methodsFor: 'test accounts with multiple transactions' stamp: 'AAB 6/27/2020 16:35:51'!
test06AccountSummaryPrintsMoreThanOneDeposit

	| receptiveAccount accountSummary |
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount .
	Deposit register: 50 on: receptiveAccount .

	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Depósito por 100.' equals: (accountSummary report at: 1).
	self assert: 'Depósito por 50.' equals: (accountSummary report at: 2).
	self assert: 'Balance = 150' equals: (accountSummary report at: 3).
	
	! !

!AccountSummaryTest methodsFor: 'test accounts with multiple transactions' stamp: 'AAB 6/27/2020 16:36:11'!
test07AccountSummaryPrintsMoreThanOneWithdraw

	| receptiveAccount accountSummary |
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount .
	Withdraw register: 20 on: receptiveAccount.
	Withdraw register: 10 on: receptiveAccount.

	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Depósito por 100.' equals: (accountSummary report at: 1).
	self assert: 'Extracción por 20.' equals: (accountSummary report at: 2).
	self assert: 'Extracción por 10.' equals: (accountSummary report at: 3).
	self assert: 'Balance = 70' equals: (accountSummary report at: 4).
	
	! !

!AccountSummaryTest methodsFor: 'test accounts with multiple transactions' stamp: 'AAB 6/27/2020 16:36:26'!
test08AccountSummaryPrintsMoreThanOneWithdrawTransfer

	| receptiveAccount accountSummary receptiveAccount2 |
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	Transfer register: 10 from: receptiveAccount to: receptiveAccount2.
	Transfer register: 20 from: receptiveAccount to: receptiveAccount2.
	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Depósito por 100.' equals: (accountSummary report at: 1).
	self assert: 'Salida por transferencia de 10.' equals: (accountSummary report at: 2).
	self assert: 'Salida por transferencia de 20.' equals: (accountSummary report at: 3).
	self assert: 'Balance = 70' equals: (accountSummary report at: 4).
	
	! !

!AccountSummaryTest methodsFor: 'test accounts with multiple transactions' stamp: 'AAB 6/27/2020 16:36:34'!
test09AccountSummaryPrintsMoreThanOneDepositTransfer

	| receptiveAccount accountSummary receptiveAccount2 |
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.

	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	Transfer register: 20 from: receptiveAccount2 to: receptiveAccount.

	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Entrada por transferencia de 10.' equals: (accountSummary report at: 1).
	self assert: 'Entrada por transferencia de 20.' equals: (accountSummary report at: 2).
	self assert: 'Balance = 30' equals: (accountSummary report at: 3).
	
	! !


!AccountSummaryTest methodsFor: 'balance' stamp: 'AAB 6/27/2020 16:33:04'!
test01AccountSummaryOfAccountWithoutTransactionsPrintsOnlyTheBalance

	| receptiveAccount accountSummary |
	receptiveAccount := ReceptiveAccount new.
	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Balance = 0' equals: (accountSummary report at: 1).
	
	! !


!AccountSummaryTest methodsFor: 'test accounts with one transaction of one type only' stamp: 'AAB 6/27/2020 16:33:40'!
test02AccountSummaryOfAccountWithDepositPrintsDepositMessageAndBalance

	| receptiveAccount accountSummary |
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount .

	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Depósito por 100.' equals: (accountSummary report at: 1).
	self assert: 'Balance = 100' equals: (accountSummary report at: 2).
	
	! !

!AccountSummaryTest methodsFor: 'test accounts with one transaction of one type only' stamp: 'AAB 6/27/2020 16:34:10'!
test03AccountSummaryOfAccountWithWithdrawPrintsWithdrawMessageAndBalance

	| receptiveAccount accountSummary |
	receptiveAccount := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount .
	Withdraw register: 20 on: receptiveAccount.

	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Depósito por 100.' equals: (accountSummary report at: 1).
	self assert: 'Extracción por 20.' equals: (accountSummary report at: 2).
	self assert: 'Balance = 80' equals: (accountSummary report at: 3).
	
	! !

!AccountSummaryTest methodsFor: 'test accounts with one transaction of one type only' stamp: 'AAB 6/27/2020 16:35:04'!
test04AccountSummaryOfAccountWithWithdrawTransferPrintsWithdrawTransferMessageAndBalance

	| receptiveAccount accountSummary receptiveAccount2 |
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount.
	Withdraw register: 20 on: receptiveAccount.
	Transfer register: 10 from: receptiveAccount to: receptiveAccount2.
	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Depósito por 100.' equals: (accountSummary report at: 1).
	self assert: 'Extracción por 20.' equals: (accountSummary report at: 2).
	self assert: 'Salida por transferencia de 10.' equals: (accountSummary report at: 3).
	self assert: 'Balance = 70' equals: (accountSummary report at: 4).
	
	! !

!AccountSummaryTest methodsFor: 'test accounts with one transaction of one type only' stamp: 'AAB 6/27/2020 16:34:51'!
test05AccountSummaryOfAccountWithDepositTransferPrintsDepositTransferMessageAndBalance

	| receptiveAccount accountSummary receptiveAccount2 |
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.

	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	accountSummary := AccountSummary for: receptiveAccount.
	
	self assert: 'Entrada por transferencia de 10.' equals: (accountSummary report at: 1).
	self assert: 'Balance = 10' equals: (accountSummary report at: 2).
	
	! !


!AccountSummaryTest methodsFor: 'is immutable' stamp: 'AAB 6/27/2020 17:03:06'!
test10AccountSummaryDoesntChangeWithModificationsToAccount

	| receptiveAccount accountSummary receptiveAccount2 |
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.

	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.

	accountSummary := AccountSummary for: receptiveAccount.
		
	Transfer register: 20 from: receptiveAccount2 to: receptiveAccount.

	self assert: 'Entrada por transferencia de 10.' equals: (accountSummary report at: 1).
	self assert: 'Balance = 10' equals: (accountSummary report at: 2).
	
	! !


!classDefinition: #PortfolioTest category: #Portfolio2!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:17:51'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: #Portfolio2!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetTest category: #Portfolio2!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferNetTest methodsFor: 'with zero transfers' stamp: 'AAB 6/27/2020 16:52:12'!
test01TransferNetOfAccountWithoutTransactionReturnsZero

	| receptiveAccount transferNet |
	
	receptiveAccount := ReceptiveAccount new.
	transferNet := TransferNet for: receptiveAccount.
	
	self assert: 'El neto de transferencias es 0.' equals: (transferNet report)
	! !


!TransferNetTest methodsFor: 'with one transfer' stamp: 'AAB 6/27/2020 16:54:28'!
test02TransferNetOfAccountWithOneDepositTransferReturnsDepositTransferValue

	| receptiveAccount transferNet receptiveAccount2 |
	
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	transferNet := TransferNet for: receptiveAccount.
	
	self assert: 'El neto de transferencias es 10.' equals: (transferNet report)
	! !

!TransferNetTest methodsFor: 'with one transfer' stamp: 'AAB 6/27/2020 16:55:30'!
test03TransferNetOfAccountWithOneWithdrawTransferReturnsWithdrawTransferNegativeValue

	| receptiveAccount transferNet receptiveAccount2 |
	
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	transferNet := TransferNet for: receptiveAccount2.
	
	self assert: 'El neto de transferencias es -10.' equals: (transferNet report)
	! !


!TransferNetTest methodsFor: 'multiple transfers' stamp: 'AAB 6/27/2020 16:56:20'!
test04TransferNetOfAccountWithMultipleDepositTransferReturnsTheSumOfDepositTransfersValues

	| receptiveAccount transferNet receptiveAccount2 |
	
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	transferNet := TransferNet for: receptiveAccount2.
	
	self assert: 'El neto de transferencias es -20.' equals: (transferNet report)
	! !

!TransferNetTest methodsFor: 'multiple transfers' stamp: 'AAB 6/27/2020 16:56:55'!
test05TransferNetOfAccountWithMultipleWithdrawTransferReturnsTheSumOfWithdrawTransfersNegativeValues

	| receptiveAccount transferNet receptiveAccount2 |
	
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	Deposit register: 50 on: receptiveAccount2.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	transferNet := TransferNet for: receptiveAccount2.
	
	self assert: 'El neto de transferencias es -20.' equals: (transferNet report)
	! !


!TransferNetTest methodsFor: 'is immutable' stamp: 'AAB 6/27/2020 17:00:58'!
test06TransferNetReportDoesntChangeWithModificationsToAccount

	| receptiveAccount transferNet receptiveAccount2 |
	
	receptiveAccount := ReceptiveAccount new.
	receptiveAccount2 := ReceptiveAccount new.
	Deposit register: 100 on: receptiveAccount2.
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.
	Deposit register: 50 on: receptiveAccount2.
	transferNet := TransferNet for: receptiveAccount2.
	
	Transfer register: 10 from: receptiveAccount2 to: receptiveAccount.

	self assert: 'El neto de transferencias es -10.' equals: (transferNet report)
	! !


!classDefinition: #TransferTest category: #Portfolio2!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferTest methodsFor: 'transfer legs' stamp: 'AAB 6/27/2020 16:46:42'!
test08ATransferDepositKnowsTransferWithdraw
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: transfer withdraw equals: transfer deposit otherSideOfTransaction.! !

!TransferTest methodsFor: 'transfer legs' stamp: 'AAB 6/27/2020 16:46:56'!
test09TransferWithdrawKnowsTransferDeposit
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: transfer deposit equals: transfer withdraw otherSideOfTransaction.! !

!TransferTest methodsFor: 'transfer legs' stamp: 'AAB 6/27/2020 16:47:39'!
test10TransferWithdrawIsRegisteredInAccount
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: receptiveAccount1 transactions includes: (transfer withdraw).! !

!TransferTest methodsFor: 'transfer legs' stamp: 'AAB 6/27/2020 16:47:54'!
test11TransferDepositIsRegisteredInAccount
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: receptiveAccount2 transactions includes: (transfer deposit).! !


!TransferTest methodsFor: 'transfer values' stamp: 'AAB 6/27/2020 16:44:01'!
test05TransferKnowsItsValue
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: 100 equals: (transfer value).! !

!TransferTest methodsFor: 'transfer values' stamp: 'AAB 6/27/2020 16:44:40'!
test06TransferKnowsAccountToWithdraw
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: receptiveAccount1 equals: (transfer receptiveAccountToWithdraw).! !

!TransferTest methodsFor: 'transfer values' stamp: 'AAB 6/27/2020 16:44:47'!
test07TransferKnowsAccountToDeposit
	
	|receptiveAccount1 receptiveAccount2 transfer|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	transfer := Transfer register: 100 from: receptiveAccount1 to: receptiveAccount2.
	
	self assert: receptiveAccount2 equals: (transfer receptiveAccountToDeposit)! !


!TransferTest methodsFor: 'errors' stamp: 'AAB 6/27/2020 16:41:31'!
test01CantTransferZero
	
	|receptiveAccount1 receptiveAccount2|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	
	
	self should: [Transfer register: 0 from: receptiveAccount1 to: receptiveAccount2 .]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: 
			Transfer cantTransferNonPositiveAmountsErrorDescription.
		]
	! !

!TransferTest methodsFor: 'errors' stamp: 'AAB 6/27/2020 16:42:38'!
test03AnAccountCantTransferToItself
	
	|receptiveAccount |
	
	receptiveAccount  := ReceptiveAccount new.
	
	self should: [Transfer register: 1 from: receptiveAccount to: receptiveAccount .]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: 
			Transfer cantTransferToSameAccountErrorDescription.
		]! !

!TransferTest methodsFor: 'errors' stamp: 'AA 6/22/2020 20:53:52'!
test04TransferValueMustBePositive
	
	|receptiveAccount1 receptiveAccount2 |
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	
	
	self should: [Transfer register: -10 from: receptiveAccount1 to: receptiveAccount2 .]
		raise: Error 
		withExceptionDo: 
		[
			:anError | 
			self assert: anError messageText equals: 
			Transfer cantTransferNonPositiveAmountsErrorDescription.
		]! !


!TransferTest methodsFor: 'balance' stamp: 'AAB 6/27/2020 16:42:09'!
test02TransferMustAffectBalanceOnBothAccounts
	
	|receptiveAccount1 receptiveAccount2|
	
	receptiveAccount1  := ReceptiveAccount new.
	receptiveAccount2  := ReceptiveAccount new.
	Deposit register: 10 on: receptiveAccount1.
	Transfer register: 1 from: receptiveAccount1 to: receptiveAccount2 .
	
	self assert: 9 equals: receptiveAccount1 balance.
	self assert: 1 equals: receptiveAccount2 balance.
	! !


!classDefinition: #Account category: #Portfolio2!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: #Portfolio2!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #Portfolio2!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: #Portfolio2!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !


!classDefinition: #AccountTransaction category: #Portfolio2!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reports' stamp: 'AAB 6/27/2020 16:24:26'!
sendTo: aReport

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #Portfolio2!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/21/2019 18:54:27'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #AccountTransfers category: #Portfolio2!
AccountTransaction subclass: #AccountTransfers
	instanceVariableNames: 'transfer value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountTransfers methodsFor: 'reports' stamp: 'AAB 6/27/2020 16:24:41'!
sendTo: aReport

	self subclassResponsibility ! !


!AccountTransfers methodsFor: 'balance' stamp: 'AAB 6/27/2020 14:13:55'!
affectBalance: aBalance 

	self subclassResponsibility.! !


!AccountTransfers methodsFor: 'value' stamp: 'AA 6/22/2020 21:40:55'!
value
	^transfer value.! !


!AccountTransfers methodsFor: 'initialization' stamp: 'AAB 6/27/2020 16:27:18'!
initializeFor: aTransfer
	transfer := aTransfer.! !


!AccountTransfers methodsFor: 'transactions' stamp: 'AAB 6/27/2020 14:37:14'!
otherSideOfTransaction

	self subclassResponsibility .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfers class' category: #Portfolio2!
AccountTransfers class
	instanceVariableNames: ''!


!AccountTransfers class methodsFor: 'instance creation' stamp: 'AAB 6/27/2020 16:27:51'!
for: aTransfer
	^self new initializeFor: aTransfer.! !


!classDefinition: #DepositTransfer category: #Portfolio2!
AccountTransfers subclass: #DepositTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!DepositTransfer methodsFor: 'reports' stamp: 'AAB 6/27/2020 16:24:55'!
sendTo: aReport

	^aReport sendDepositTransfer: self! !


!DepositTransfer methodsFor: 'transactions' stamp: 'AAB 6/27/2020 14:37:28'!
otherSideOfTransaction

	^ transfer withdraw ! !


!DepositTransfer methodsFor: 'balance' stamp: 'AA 6/22/2020 21:43:36'!
affectBalance: aBalance

	^aBalance + self value ! !


!classDefinition: #WithdrawTransfer category: #Portfolio2!
AccountTransfers subclass: #WithdrawTransfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!WithdrawTransfer methodsFor: 'reports' stamp: 'AAB 6/27/2020 16:25:02'!
sendTo: aReport

	^aReport sendWithdrawTransfer: self! !


!WithdrawTransfer methodsFor: 'balance' stamp: 'AA 6/22/2020 21:43:41'!
affectBalance: aBalance

	^aBalance - self value ! !


!WithdrawTransfer methodsFor: 'transactions' stamp: 'AAB 6/27/2020 14:39:42'!
otherSideOfTransaction
	^transfer deposit ! !


!classDefinition: #Deposit category: #Portfolio2!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'reports' stamp: 'AAB 6/27/2020 16:25:06'!
sendTo: aReport

	^aReport sendDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #Portfolio2!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #Portfolio2!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'reports' stamp: 'AAB 6/27/2020 16:25:12'!
sendTo: aReport

	^aReport sendWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #Portfolio2!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Reports category: #Portfolio2!
Object subclass: #Reports
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Reports methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:16:30'!
sendDeposit: aDeposit

	self subclassResponsibility ! !

!Reports methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:16:42'!
sendDepositTransfer: aDepositTransfer

	self subclassResponsibility ! !

!Reports methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:16:52'!
sendWithdraw: aWithdraw

	self subclassResponsibility ! !

!Reports methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:17:05'!
sendWithdrawTransfer: aWithdrawTransfer

	self subclassResponsibility ! !


!Reports methodsFor: 'initialization' stamp: 'AAB 6/27/2020 16:19:37'!
initializeWith: anAccount

	self subclassResponsibility.! !


!Reports methodsFor: 'report' stamp: 'AAB 6/27/2020 16:18:02'!
report
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Reports class' category: #Portfolio2!
Reports class
	instanceVariableNames: ''!

!Reports class methodsFor: 'instance creation' stamp: 'AAB 6/27/2020 16:19:48'!
for: anAccount 
	
	^ self new initializeWith: anAccount! !


!classDefinition: #AccountSummary category: #Portfolio2!
Reports subclass: #AccountSummary
	instanceVariableNames: 'account balance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!AccountSummary methodsFor: 'transactions' stamp: 'AAB 6/27/2020 15:42:01'!
sendDeposit: aDeposit

	^ 'Depósito por ', aDeposit value asString, '.'
! !

!AccountSummary methodsFor: 'transactions' stamp: 'AAB 6/27/2020 15:35:25'!
sendDepositTransfer: aDepositTransfer

	^ 'Entrada por transferencia de ', aDepositTransfer value asString, '.'
! !

!AccountSummary methodsFor: 'transactions' stamp: 'AAB 6/27/2020 15:42:06'!
sendWithdraw: aWithdraw

	^ 'Extracción por ', aWithdraw value asString, '.'
! !

!AccountSummary methodsFor: 'transactions' stamp: 'AAB 6/27/2020 15:42:40'!
sendWithdrawTransfer: aWithdrawTransfer

	^ 'Salida por transferencia de ', aWithdrawTransfer value asString, '.'
! !


!AccountSummary methodsFor: 'initialization' stamp: 'AAB 6/27/2020 15:03:27'!
initializeWith: anAccount 
	
	transactions := anAccount transactions.
	balance := anAccount balance.! !


!AccountSummary methodsFor: 'report' stamp: 'AAB 6/27/2020 15:24:02'!
addReportBalance: reportAsOrderedCollection

	^ reportAsOrderedCollection addLast: 'Balance = ', balance asString! !

!AccountSummary methodsFor: 'report' stamp: 'AAB 6/27/2020 15:41:44'!
report
	| reportAsOrderedCollection |
	
	reportAsOrderedCollection := OrderedCollection new.
	
	transactions do: [:aTransaction | 
		reportAsOrderedCollection addLast: (aTransaction sendTo: self).
	].
	self addReportBalance: reportAsOrderedCollection .
	
	^reportAsOrderedCollection ! !


!classDefinition: #TransferNet category: #Portfolio2!
Reports subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!TransferNet methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:12:35'!
sendDeposit: aDeposit

	^0.! !

!TransferNet methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:11:15'!
sendDepositTransfer: aDepositTransfer

	^ aDepositTransfer value.! !

!TransferNet methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:12:44'!
sendWithdraw: aWithdraw

	^0.! !

!TransferNet methodsFor: 'transactions' stamp: 'AAB 6/27/2020 16:11:40'!
sendWithdrawTransfer: aWithdrawTransfer

	^ aWithdrawTransfer value negated.! !


!TransferNet methodsFor: 'initialization' stamp: 'AAB 6/27/2020 16:18:44'!
initializeWith: anAccount
	
	transactions := anAccount transactions.! !


!TransferNet methodsFor: 'report' stamp: 'AAB 6/27/2020 16:13:34'!
report
	| transferNet |
	transferNet := 0.

	transactions do: [:aTransaction|
		transferNet := transferNet + (aTransaction sendTo: self).
	].
	^ 'El neto de transferencias es ', transferNet asString, '.'.! !


!classDefinition: #Transfer category: #Portfolio2!
Object subclass: #Transfer
	instanceVariableNames: 'value receptiveAccountToWithdraw receptiveAccountToDeposit withdraw deposit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio2'!

!Transfer methodsFor: 'deposit' stamp: 'AAB 6/27/2020 14:38:39'!
deposit
	^deposit! !

!Transfer methodsFor: 'deposit' stamp: 'AA 6/22/2020 20:12:56'!
receptiveAccountToDeposit
	^receptiveAccountToDeposit! !


!Transfer methodsFor: 'withdraw' stamp: 'AA 6/22/2020 20:10:40'!
receptiveAccountToWithdraw
	^receptiveAccountToWithdraw! !

!Transfer methodsFor: 'withdraw' stamp: 'AAB 6/27/2020 14:35:55'!
withdraw

	^withdraw! !


!Transfer methodsFor: 'value' stamp: 'AA 6/22/2020 20:00:21'!
value
	^value! !


!Transfer methodsFor: 'initialization' stamp: 'AAB 6/27/2020 14:22:37'!
initializeFor: aValue from: aReceptiveAccountWithdrawn to: aReceptiveAccountToDeposit
	value := aValue .
	receptiveAccountToWithdraw := aReceptiveAccountWithdrawn.
	receptiveAccountToDeposit := aReceptiveAccountToDeposit .
	withdraw := WithdrawTransfer  register: self on: aReceptiveAccountWithdrawn .
	deposit := DepositTransfer register: self on: aReceptiveAccountToDeposit.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #Portfolio2!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'AA 6/22/2020 20:54:14'!
cantTransferNonPositiveAmountsErrorDescription
	^'Cant transfer non positive amounts'! !

!Transfer class methodsFor: 'errors' stamp: 'AA 6/22/2020 19:52:14'!
cantTransferToSameAccountErrorDescription
	^'Cant transfer from account to same acount'! !


!Transfer class methodsFor: 'instance creation' stamp: 'AAB 6/27/2020 14:36:45'!
register: aValue from: anAccountToWithdraw to: anAccountToDeposit
	|transfer |
	(anAccountToWithdraw = anAccountToDeposit) ifTrue: [self error: self cantTransferToSameAccountErrorDescription].
	(aValue <= 0) ifTrue: [self error: self cantTransferNonPositiveAmountsErrorDescription].
	transfer := self new initializeFor: aValue from: anAccountToWithdraw to: anAccountToDeposit.

	^transfer.
	! !
