!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 14:51:17'!
test09CanNotAddNonIntegerNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 1.5 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:30:32'!
test10CartWithOneItemReturnsPriceCorrectly

	| aCart priceList |
	
	aCart := self createCart.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	
	aCart add: 'validBook'.
	
	self assert: 15 equals: aCart totalPriceOfProducts.! !

!CartTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:30:52'!
test11CartWithManyOfTheSameItemsReturnsPriceCorrectly

	| aCart priceList |
	
	aCart := self createCart.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	
	aCart add: 3 of: 'validBook'.
	
	self assert: 45 equals: aCart totalPriceOfProducts.! !

!CartTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:31:05'!
test12CartWithDifferentItemsReturnsPriceCorrectly

	| aCart priceList |
	
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	
	aCart add: 3 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	self assert: 65 equals: aCart totalPriceOfProducts.
	! !


!CartTest methodsFor: 'support' stamp: 'AAB 7/11/2020 15:49:05'!
createCart
	
	^Cart acceptingItemsOf: self defaultPriceList! !

!CartTest methodsFor: 'support' stamp: 'AAB 7/11/2020 15:49:05'!
defaultPriceList
	
	| priceList |
	priceList := Dictionary new.
	priceList add: (Association key: self itemSellByTheStore value: self priceOfItemSellByTheStore).
	^ priceList
	! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'AAB 7/11/2020 16:02:16'!
itemSellByTheStore
	
	^ 'validBook'! !

!CartTest methodsFor: 'support' stamp: 'AAB 7/11/2020 15:47:45'!
priceOfItemSellByTheStore
	
	^ 15! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'clientId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:06:34'!
merchantProcessorSimulatorThatAcceptsCard

	^ MerchantProcessorSimulator createWith: ['The credit card was accepted.']! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 22:56:49'!
test01CantCheckoutAnEmptyCart 
	|aCashier aCart aCreditCard aDate aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook. 
	aCart := Cart acceptingItemsOf: (Array new). 
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessor forClient: clientId ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| 
			self assert: anError messageText = Cashier cantCheckoutAnEmptyCartErrorMessage.
			 self assert: (aCashier salesBookIsEmpty: clientId). 
		] ! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/22/2020 22:25:36'!
test02PurchaseListIsNotEmptyAfterAValidCheckout
	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook | 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook. 
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 'validBook'.
	 (aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessor forClient: clientId ).
	
	self assert: 15 equals: (aCashier lastSale: clientId) total . 
	self deny: (aCashier salesBookIsEmpty: clientId) .! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 22:51:54'!
test03CartIsEmptyAfterAValidCheckout

	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.
	
	aCart add: 'validBook'.
	aCashier  
		checkoutCart: aCart 
		withCreditCard: aCreditCard 
		onDate: aDate 
		usingMerchantProcessor: aMerchantProcessor 
		forClient: clientId .
	
	self assert: aCart isEmpty.! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:04:02'!
test04CantCheckoutWithAnExpiredCreditCard

	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook. 
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '052020'.
	aDate := Date year: 2020 month: 6 day: 1.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 'validBook'.
	
	self
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessor forClient: clientId . ] 
		raise: Error 
		withExceptionDo: [:anError |
			self assert: anError messageText = Cashier cantCheckoutWithExpiredCreditCardErrorMessage.
			self assert: (aCashier salesBookIsEmpty: clientId) .
			self deny: aCart isEmpty.
		]
! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:12:27'!
test05PurchaseListContainsItems
	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook lastSale| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	aCashier 
		checkoutCart: aCart 
		withCreditCard: aCreditCard 
		onDate: aDate 
		usingMerchantProcessor: aMerchantProcessor 
		forClient: clientId .
	lastSale := ((aCashier lastSale: clientId) productsSold ).	
		
	self assert: 2 equals: (lastSale occurrencesOf: 'anotherValidBook').
	self assert:  4 equals: (lastSale occurrencesOf: 'validBook').
	self assert: 6 equals: lastSale size.
! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:04:56'!
test06CantCheckoutWithAStolenCreditCard
	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := MerchantProcessorSimulator createWith: [self error: MerchantProcessorSimulator stolenCardErrorDescription].

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessor forClient: clientId .]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessorSimulator stolenCardErrorDescription.
			self assert: (aCashier salesBookIsEmpty: clientId ).
			self deny: aCart isEmpty.
		]

! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:05:18'!
test07CantCheckoutWithACreditCardThatDoesntHaveEnoughFunds
	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := MerchantProcessorSimulator createWith: [self error: MerchantProcessorSimulator  notEnoughFundsErrorDescription].

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessor forClient: clientId .]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessorSimulator notEnoughFundsErrorDescription.
			self assert: (aCashier salesBookIsEmpty: clientId).
			self deny: aCart isEmpty.
		]

! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:17:36'!
test08CashierCanReadFromANonEmptySalesBook
	|aCashier aSalesBook lastSale| 
	
	aSalesBook := self nonEmptySalesBook.
	aCashier := Cashier with: aSalesBook.
	
	lastSale := ((aCashier lastSale: clientId) productsSold ).	
		
	self assert: 2 equals: (lastSale occurrencesOf: 'anotherValidBook').
	self assert: 2 equals: lastSale size.

! !

!CashierTest methodsFor: 'tests' stamp: 'AA 7/22/2020 22:50:26'!
test09CashierCantCheckoutACartWithTotalHigherThanAQuadrillion
	|aCashier aCart priceList aCreditCard aDate aMerchantProcessor aSalesBook | 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'anotherValidBook' value: 1000000000000000).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aDate := Date year: 2020 month: 1 day: 1.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 1 of: 'anotherValidBook'.

	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessor forClient: clientId .]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = Cashier excededMaximumTransactionAmmountErrorDescription.
			self assert: (aCashier salesBookIsEmpty: clientId ).
			self deny: aCart isEmpty.
		]
! !


!CashierTest methodsFor: 'setUp' stamp: 'AAB 7/11/2020 19:11:56'!
creditCard

	^CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.	! !

!CashierTest methodsFor: 'setUp' stamp: 'AA 7/21/2020 22:52:28'!
emptySalesBook
	
	^ SalesBook new.! !

!CashierTest methodsFor: 'setUp' stamp: 'AA 7/21/2020 23:18:58'!
nonEmptySalesBook
	| salesBook products sale |
	
	salesBook := SalesBook new.
	products := Bag new.
	products add: 'anotherValidBook' withOccurrences: 2.
	sale := Sale of: products withATotal: 80 madeIn: Date today using: self creditCard.
	
	salesBook addSale: sale purchasedBy: clientId .
	
	^ salesBook.! !

!CashierTest methodsFor: 'setUp' stamp: 'AA 7/21/2020 22:50:45'!
setUp 
	clientId := '1'.! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:17:28'!
test01CreditCardReturnsDataInCorrectFormat

	| aCreditCard |
	
	
	aCreditCard := CreditCard withNumber: '0000000000000000' ofOwner: 'Pepe Sanchez' withExpiration: '062022'.
	
	self assert: 0000000000000000 equals: aCreditCard creditCardNumber.
	self assert: 'Pepe Sanchez' equals: aCreditCard creditCardOwnerName.
	self assert: (Month month: 6 year: 2022) equals: aCreditCard creditCardExpiration.! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:17:52'!
test02CreditCardNumberMustBe16CharactersLong
	
	self 
		should: [CreditCard withNumber: '1' ofOwner: 'Pepe Sanchez' withExpiration: '062022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardNumberMustHave16DigitsErrorMessage].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:18:38'!
test03CreditCardNumberMustBeDigits
	
	self 
		should: [CreditCard withNumber: 'aaaaaaaaaaaaaaaa' ofOwner: 'Pepe Sanchez' withExpiration: '062022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardNumberMustHave16DigitsErrorMessage].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:20:23'!
test04CreditCardNamesMustHaveAtLeastOneBlankSpace
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: 'PepeSanchez' withExpiration: '062022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardNameMustBeAValidFullNameErrorMessage].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:21:51'!
test05CardOwnerNameCantStartWithABlankSpace
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: '   Pepe Sanchez Gomez    ' withExpiration: '062022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardNameMustBeAValidFullNameErrorMessage].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:22:25'!
test06CreditCardOwnerNameMustHaveThirtyOrLessCharacters
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Pepee Pepee Pepee Pepee Pepee' withExpiration: '062022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardNameMustHaveThirtyCharactersOrLessErrorMessage].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:22:49'!
test07CreditCardOwnerNameCantContainSymbols
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee @@@' withExpiration: '062022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardNameMustBeAValidFullNameErrorMessage ].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:23:19'!
test08CreditCardExpirationMustHaveSixCharacters
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Sanchez' withExpiration: '06002022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardExpirationMustHaveSixDigitsErrorMessage ].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:23:44'!
test09CreditCardExpirationMustHaveOnlyDigits
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Sanchez' withExpiration: 'a@aaaa'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardExpirationMustBeAValidExpirationErrorMessage ].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 18:24:01'!
test10CreditCardExpirationMustHaveAValidMonthNumber
	
	self 
		should: [CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Sanchez' withExpiration: '132022'] 
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText = CreditCard creditCardExpirationMustBeAValidExpirationErrorMessage ].! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/13/2020 20:38:42'!
test11ACreditCardDoesntExpireUntilExpirationDate

	| aCreditCard aMonthYear |

	aCreditCard := CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Sanchez' withExpiration: '062020'.
	aMonthYear := Month month: 1 year: 2020.
	
	self deny: (aCreditCard isExpiredOn: aMonthYear).
	
		! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/13/2020 20:39:46'!
test12ACreditCardUsedYearsAfterExpirationIsExpired

	| aCreditCard aMonthYear |

	aCreditCard := CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Sanchez' withExpiration: '062020'.
	aMonthYear := Month month: 1 year: 2021.
	
	self assert: (aCreditCard isExpiredOn: aMonthYear).
	
		! !

!CreditCardTest methodsFor: 'tests' stamp: 'AAB 7/13/2020 20:39:39'!
test13ACreditCardUsedMonthsAfterExpirationIsExpired

	| aCreditCard aMonthYear |

	aCreditCard := CreditCard withNumber: '0000000000000000' ofOwner: 'Pepee Sanchez' withExpiration: '062020'.
	aMonthYear := Month month: 7 year: 2020.
	
	self assert: (aCreditCard isExpiredOn: aMonthYear).
	
		! !


!classDefinition: #InterfazTusLibrosTest category: #TusLibros!
TestCase subclass: #InterfazTusLibrosTest
	instanceVariableNames: 'authenticationSystem priceList cashier clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 16:52:29'!
test01InvalidClientIDCantCreateACart

	| interface |

	interface := self interfaz.
	
	self
		should: [interface createCartWithClientId: self invalidClientId andPassword: self validPasswordForValidClientId1 ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros invalidClientIdErrorMessage
		]
	
	! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 16:52:25'!
test02AClientWithAnInvalidPasswordCantCreateACart

	| interface|

	interface := self interfaz.
	
	self
		should: [interface createCartWithClientId: self validClient1 andPassword: self wrongPasswordForClient1 ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros wrongPasswordErrorMessage
		]
! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 16:57:26'!
test03AValidClientWithPasswordsCreatesAnEmptyCart

	| interface aCartId |

	interface := self interfaz.
	
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	self assert: (interface cartWithIdIsEmpty: aCartId).! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/20/2020 11:24:27'!
test04AClientCanCreateMoreThanOneCart

	| interface aCartId aCartId2 |

	interface := self interfaz.
	
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	aCartId2 := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	self assert: (interface cartWithIdIsEmpty: aCartId2).! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 17:20:01'!
test05CantAddBooksToCartWithInvalidCartId

	| interface|

	interface := self interfaz.
	
	self
		should: [ interface addToCart: self invalidCartId aQuantity: 1 ofBookISBN: self validBookISBN  ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros invalidCartIdErrorMessage
		]
! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 22:40:11'!
test06ListCartOfValidCartIdReturnsProductsInCart

	| interface aCartId |

	interface := self interfaz.
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	interface addToCart: aCartId aQuantity: 1 ofBookISBN: self validBookISBN.
	
	self assert: 1 equals: (interface listCart: aCartId) size.
	self assert: 1 equals: ((interface listCart: aCartId) occurrencesOf: self validBookISBN).! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 17:41:24'!
test07CantGetListCartWithInvalidCartId

	| interface|

	interface := self interfaz.
	
	self
		should: [ interface listCart: self invalidCartId ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros invalidCartIdErrorMessage
		]
! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 22:32:17'!
test08CantCheckoutCartCartWithInvalidCartId

	| interface|

	interface := self interfaz.
	
	self
		should: [ interface 
			checkoutCart: self invalidCartId 
			withCardNumber: self creditCardNumber 
			ofOwner: self creditCardOwner 
			withExpiration: self nonExpiredcreditCardExpiration
			onDate: clock now date.
		] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros invalidCartIdErrorMessage
		]
! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:38:11'!
test09ListPurchasesReturnsProductsSoldAfterCheckout

	| interface aCartId purchases|
 
	interface := self interfaz.
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	interface addToCart: aCartId aQuantity: 1 ofBookISBN: self validBookISBN.

	interface 
		checkoutCart: aCartId
		withCardNumber: self creditCardNumber 
		ofOwner: self creditCardOwner 
		withExpiration: self nonExpiredcreditCardExpiration
		onDate: clock now date.
	
	purchases := (interface listPurchasesOfClient: self validClient1 withPassword: self validPasswordForValidClientId1).
	self assert: 15 equals: (purchases at: 'total').
	self assert: 1 equals: ((purchases at: 'products') occurrencesOf: 'validBook').
! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 18:36:59'!
test10InvalidClientIdCantAccessToListPurchases


	| interface|

	interface := self interfaz.
	
	self
		should: [ interface listPurchasesOfClient: self invalidClientId withPassword: self validPasswordForValidClientId1 .] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros invalidClientIdErrorMessage
		]! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AAB 7/19/2020 18:38:34'!
test11WrongClientPasswordCantAccessToListPurchases


	| interface|

	interface := self interfaz.
	
	self
		should: [ interface listPurchasesOfClient: self validClient1 withPassword: self wrongPasswordForClient1 .] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros wrongPasswordErrorMessage 
		]! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:33:20'!
test12AfterCheckoutCartIdIsNoLongerValid


	| interface aCartId|
 
	interface := self interfaz.
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	interface addToCart: aCartId aQuantity: 1 ofBookISBN: self validBookISBN.

	interface 
		checkoutCart: aCartId
		withCardNumber: self creditCardNumber 
		ofOwner: self creditCardOwner 
		withExpiration: self nonExpiredcreditCardExpiration
		onDate: clock now date.
		
	self
		should: [ interface addToCart: aCartId aQuantity: 1 ofBookISBN: self validBookISBN.] 
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros invalidCartIdErrorMessage
		].! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:38:33'!
test13ListPurchasesReturnsProductsCorrectlyAfteroMoreThanOnePurchase


	| interface aCartId purchases|
 
	interface := self interfaz.
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	interface addToCart: aCartId aQuantity: 1 ofBookISBN: self validBookISBN.
	interface 
		checkoutCart: aCartId
		withCardNumber: self creditCardNumber 
		ofOwner: self creditCardOwner 
		withExpiration: self nonExpiredcreditCardExpiration
		onDate: clock now date.
		
	aCartId := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1.
	interface addToCart: aCartId aQuantity: 1 ofBookISBN: self validBookISBN.
	interface 
		checkoutCart: aCartId
		withCardNumber: self creditCardNumber 
		ofOwner: self creditCardOwner 
		withExpiration: self nonExpiredcreditCardExpiration
		onDate: clock now date.
		
	purchases := (interface listPurchasesOfClient: self validClient1 withPassword: self validPasswordForValidClientId1).
	self assert: 30 equals: (purchases at: 'total').
	self assert: 2 equals: ((purchases at: 'products') occurrencesOf: 'validBook').! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:42:54'!
test14CorrectlyReturnPurchaseListOfAClientWithoutPurchases


	| interface purchases |
 
	interface := self interfaz.
	
	purchases := (interface listPurchasesOfClient: self validClient1 withPassword: self validPasswordForValidClientId1).
	self assert: 0 equals: (purchases at: 'total').
	self assert: 0 equals: ((purchases at: 'products') size).! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:55:47'!
test15CantGetListCartOfAnExpiredCart
	| interface aCart|
 
	interface := self interfaz.
	
	aCart := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1 .
	clock forwardTime: 31 minutes.
	self
		should: [interface listCart: aCart ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros cartExpiredErrorMessage .
		]
	! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:58:14'!
test16CantCheckoutAnExpiredCart
	| interface aCart|
 
	interface := self interfaz.
	
	aCart := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1 .
	interface addToCart: aCart aQuantity: 1 ofBookISBN: self validBookISBN.
	clock forwardTime: 31 minutes.
	self
		should: 
		[
			interface checkoutCart: aCart
				withCardNumber: self creditCardNumber 
				ofOwner: self creditCardOwner 
				withExpiration: self nonExpiredcreditCardExpiration
				onDate: clock now date.
		]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros cartExpiredErrorMessage .
		]
	! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/21/2020 23:59:15'!
test17CantAddItemsToAnExpiredCart
	| interface aCart|
 
	interface := self interfaz.
	
	aCart := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1 .
	
	clock forwardTime: 31 minutes.
	self
		should: 
		[
			interface addToCart: aCart aQuantity: 1 ofBookISBN: self validBookISBN.
		]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros cartExpiredErrorMessage .
		]
	! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/22/2020 00:19:59'!
test18AddingItemsToACartExtendsExpirationTimeTo30MinutesAfterAdding
	|interface aCart list|
 
	interface := self interfaz.
	
	aCart := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1 .
	
	clock forwardTime: 20 minutes.
	interface addToCart: aCart aQuantity: 1 ofBookISBN: self validBookISBN.
	clock forwardTime: 15 minutes. 
	interface addToCart: aCart aQuantity: 1 ofBookISBN: self validBookISBN.
	list := interface listCart: aCart. 
	
	self assert: 2 equals: (list occurrencesOf: self validBookISBN) .
	clock forwardTime: 31 minutes.
	self
		should: 
		[
			interface addToCart: aCart aQuantity: 1 ofBookISBN: self validBookISBN.
		]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros cartExpiredErrorMessage .
		]
	
	! !

!InterfazTusLibrosTest methodsFor: 'tests' stamp: 'AA 7/22/2020 00:22:20'!
test19ListCartExtendsExpirationTimeTo30MinutesAfter
	|interface aCart |
	interface := self interfaz.
	aCart := interface createCartWithClientId: self validClient1 andPassword: self validPasswordForValidClientId1 .
	clock forwardTime: 20 minutes.
	interface listCart: aCart.
	clock forwardTime: 15 minutes. 
	interface listCart: aCart.
	clock forwardTime: 31 minutes.
	self
		should: 
		[
			interface listCart: aCart.
		]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = InterfazTusLibros cartExpiredErrorMessage .
		]
	
	! !


!InterfazTusLibrosTest methodsFor: 'setUp/tearDown' stamp: 'AA 7/21/2020 21:35:53'!
setUp

	authenticationSystem := AuthenticationSystemSimulator new.
	authenticationSystem addClient: self validClient1 withPassword: self validPasswordForValidClientId1 .
	cashier := self cashier.
	priceList := self priceList.
	clock := self clockSimulator.	! !


!InterfazTusLibrosTest methodsFor: 'simulated items initialization' stamp: 'AA 7/21/2020 22:44:30'!
cashier

	^ Cashier with: SalesBook new.! !

!InterfazTusLibrosTest methodsFor: 'simulated items initialization' stamp: 'AAB 7/23/2020 14:45:48'!
clockSimulator
	^ClockSimulator createWith: DateAndTime now.! !

!InterfazTusLibrosTest methodsFor: 'simulated items initialization' stamp: 'AA 7/21/2020 23:53:21'!
interfaz

	^ InterfazTusLibros 
		createWithAuthenticationSystem: authenticationSystem
		priceList: priceList 
		cashier: cashier
		merchantProcessor: self merchantProcessor 
		clock: clock .! !

!InterfazTusLibrosTest methodsFor: 'simulated items initialization' stamp: 'AAB 7/19/2020 18:28:53'!
merchantProcessor

	^ MerchantProcessorSimulator createWith: ['The credit card was accepted']! !

!InterfazTusLibrosTest methodsFor: 'simulated items initialization' stamp: 'AAB 7/20/2020 08:30:30'!
priceList
	| newPriceList |
	
	newPriceList := Dictionary new.
	newPriceList add: (Association key: 'validBook' value: 15).
	^ newPriceList 
	! !


!InterfazTusLibrosTest methodsFor: 'price list' stamp: 'AAB 7/19/2020 17:26:05'!
validBookISBN
	
	^'validBook'! !


!InterfazTusLibrosTest methodsFor: 'credit card' stamp: 'AAB 7/19/2020 17:48:16'!
creditCardNumber

	^'0123012301230123'	! !

!InterfazTusLibrosTest methodsFor: 'credit card' stamp: 'AAB 7/19/2020 17:48:31'!
creditCardOwner

	^'Pepe Sanchez'! !

!InterfazTusLibrosTest methodsFor: 'credit card' stamp: 'AA 7/21/2020 23:28:43'!
nonExpiredcreditCardExpiration

	|month year|
	month := clock now monthIndex.  
	month < 10 ifTrue: [month := '0', month asString] ifFalse: [month := month asString].
	year := clock now yearNumber + 3.
	
	^month , year asString.! !


!InterfazTusLibrosTest methodsFor: 'client password and username' stamp: 'AAB 7/19/2020 15:58:36'!
invalidClientId
	
	^ 'InvalidClientId'! !

!InterfazTusLibrosTest methodsFor: 'client password and username' stamp: 'AAB 7/20/2020 10:43:20'!
validClient1
	
	^'1'! !

!InterfazTusLibrosTest methodsFor: 'client password and username' stamp: 'AAB 7/19/2020 16:01:46'!
validPasswordForValidClientId1
	
	^ 'password'! !

!InterfazTusLibrosTest methodsFor: 'client password and username' stamp: 'AAB 7/19/2020 16:07:49'!
wrongPasswordForClient1
	
	^'wrongPasswordForClient1'! !


!InterfazTusLibrosTest methodsFor: 'invalid items' stamp: 'AAB 7/19/2020 17:17:39'!
invalidCartId
	
	^'invalidCartId'! !


!classDefinition: #SalesBookTest category: #TusLibros!
TestCase subclass: #SalesBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SalesBookTest methodsFor: 'test' stamp: 'AA 7/22/2020 00:38:03'!
test01SalesBookAddsSaleOfClientAndKnowsProductsBought

	| aSalesBook aClientId aSale aCreditCard productsSold sale|
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.
	productsSold := OrderedCollection with: 'validBook'.	
	aSale := Sale of: productsSold withATotal: 15 madeIn: Date today using: aCreditCard.
	
	aSalesBook addSale: aSale purchasedBy: aClientId.
	
	sale := aSalesBook productsBoughtBy: aClientId.
	self assert: 1 equals: (sale occurrencesOf: 'validBook').
	self assert: 1 equals: sale size.! !

!SalesBookTest methodsFor: 'test' stamp: 'AA 7/22/2020 00:38:55'!
test02SalesBookAddsMultipleSalesOfAClientAndKnowsProductsBought

	| aSalesBook aClientId aCreditCard productsSoldOnFirstSale productsSoldOnSecondSale firstSale secondSale sale|
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.
	
	productsSoldOnFirstSale := OrderedCollection with: 'validBook'.
	firstSale := Sale of: productsSoldOnFirstSale withATotal: 15 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: firstSale purchasedBy: aClientId.
	
	productsSoldOnSecondSale := OrderedCollection with: 'anotherValidBook' with: 'anotherValidBook' with: 'validBook'.
	secondSale := Sale of: productsSoldOnSecondSale withATotal: 35 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: secondSale purchasedBy: aClientId.
	
	sale := aSalesBook productsBoughtBy: aClientId.
	self assert: 2 equals: (sale occurrencesOf: 'validBook').
	self assert: 2 equals: (sale occurrencesOf: 'anotherValidBook').
	self assert: 4 equals: sale size.
	
	! !

!SalesBookTest methodsFor: 'test' stamp: 'AAB 7/20/2020 14:26:42'!
test03SalesBookAddsSaleOfClientAndKnowsPriceOfProductsBought

	| aSalesBook aClientId aSale aCreditCard productsSold|
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.
	productsSold := OrderedCollection with: 'validBook'.	
	aSale := Sale of: productsSold withATotal: 15 madeIn: Date today using: aCreditCard.
	
	aSalesBook addSale: aSale purchasedBy: aClientId.
	
	self assert: 15 equals: (aSalesBook totalOfProductsBoughtBy: aClientId) .! !

!SalesBookTest methodsFor: 'test' stamp: 'AAB 7/20/2020 14:29:55'!
test04SalesBookAddsMultipleSalesOfAClientAndKnowsTotalPriceOfProductsBought

	| aSalesBook aClientId aCreditCard productsSoldOnFirstSale productsSoldOnSecondSale firstSale secondSale |
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.
	
	productsSoldOnFirstSale := OrderedCollection with: 'validBook'.
	firstSale := Sale of: productsSoldOnFirstSale withATotal: 15 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: firstSale purchasedBy: aClientId.
	
	productsSoldOnSecondSale := OrderedCollection with: 'anotherValidBook' with: 'anotherValidBook' with: 'validBook'.
	secondSale := Sale of: productsSoldOnSecondSale withATotal: 35 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: secondSale purchasedBy: aClientId.

	self assert: 50 equals: (aSalesBook totalOfProductsBoughtBy: aClientId).! !

!SalesBookTest methodsFor: 'test' stamp: 'AA 7/22/2020 00:42:58'!
test05SalesBookListPurchasesWithOneItemHasCorrectPriceTotal

	| aSalesBook aClientId aCreditCard productsSoldOnFirstSale firstSale sales|
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.
	
	productsSoldOnFirstSale := OrderedCollection with: 'validBook'.
	firstSale := Sale of: productsSoldOnFirstSale withATotal: 15 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: firstSale purchasedBy: aClientId.

	sales := aSalesBook listPurchasesOf: aClientId.
	self assert: 15 equals: (sales at: 'total').! !

!SalesBookTest methodsFor: 'test' stamp: 'AA 7/22/2020 00:43:36'!
test06SalesBookListPurchasesWithMultipleItemsHasCorrectPriceTotal

	| aSalesBook aClientId aCreditCard productsSoldOnFirstSale productsSoldOnSecondSale firstSale secondSale sales|
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.
	
	productsSoldOnFirstSale := OrderedCollection with: 'validBook'.
	firstSale := Sale of: productsSoldOnFirstSale withATotal: 15 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: firstSale purchasedBy: aClientId.
	
	productsSoldOnSecondSale := OrderedCollection with: 'anotherValidBook' with: 'anotherValidBook' with: 'validBook'.
	secondSale := Sale of: productsSoldOnSecondSale withATotal: 35 madeIn: Date today using: aCreditCard.
	aSalesBook addSale: secondSale purchasedBy: aClientId.

	
	sales := aSalesBook listPurchasesOf: aClientId.
	self assert: 50 equals: (sales at: 'total').! !

!SalesBookTest methodsFor: 'test' stamp: 'AA 7/22/2020 00:46:02'!
test07SalesBookOfClientWithoutPurchasesHasTotalEqualZero

	| aSalesBook aClientId sales |
	
	aSalesBook := SalesBook new.
	aClientId := 1.
	sales := aSalesBook listPurchasesOf: aClientId.
	
	self assert: 0 equals: (sales at: 'total').
	self assert: 0 equals: (sales at: 'products') size.! !


!classDefinition: #AuthenticationSystemSimulator category: #TusLibros!
Object subclass: #AuthenticationSystemSimulator
	instanceVariableNames: 'client password'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticationSystemSimulator methodsFor: 'authentication' stamp: 'AAB 7/19/2020 16:25:29'!
isValidClient: aClientId
	
	^ client = aClientId! !

!AuthenticationSystemSimulator methodsFor: 'authentication' stamp: 'AAB 7/20/2020 08:21:39'!
isValidPassword: aPassword forClient: aClientId 
	
	^ aPassword = password and: [self isValidClient: aClientId ]! !


!AuthenticationSystemSimulator methodsFor: 'add client' stamp: 'AAB 7/19/2020 16:24:44'!
addClient: aClientId withPassword: aClientIdPassword
	
	client := aClientId.
	password := aClientIdPassword.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'priceList items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'AAB 7/11/2020 15:57:29'!
assertIsValidItem: anItem

	(priceList includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'AAB 7/11/2020 14:53:05'!
assertIsValidQuantity: aQuantity

	(aQuantity strictlyPositive and: aQuantity isInteger) ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'AAB 7/11/2020 15:57:29'!
initializeAcceptingItemsOf: aPriceList

	priceList := aPriceList.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'AAB 7/11/2020 14:50:36'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	aQuantity timesRepeat: [items add: anItem ]! !


!Cart methodsFor: 'listing items in cart' stamp: 'AA 7/21/2020 22:41:50'!
listOfProducts

	| bag |
	
	bag := Bag new.
	items do: [:item | bag add: item].
	
	^bag.
	! !


!Cart methodsFor: 'price of products' stamp: 'AAB 7/11/2020 15:58:07'!
totalPriceOfProducts
	
	|total |
	total := 0.
	
	items do: [:item | 
		total := total + priceList at: item.
	].
	^total! !


!Cart methodsFor: 'cart emptying' stamp: 'AAB 7/11/2020 16:08:51'!
emptyCart
	
	items := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'AAB 7/11/2020 15:34:34'!
acceptingItemsOf: aPriceList

	^self new initializeAcceptingItemsOf: aPriceList ! !


!classDefinition: #CartSession category: #TusLibros!
Object subclass: #CartSession
	instanceVariableNames: 'cashier merchantProcessor cart lastTimeUsed clientId clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartSession methodsFor: 'initialization' stamp: 'AA 7/22/2020 00:15:21'!
initializeWithCashier: aCashier merchantProcessor: aMerchantProcessor client: aClientId dateAndTime: aClock cart: aCart
	cashier := aCashier.
	merchantProcessor := aMerchantProcessor.
	cart := aCart.
	clock := aClock.
	lastTimeUsed := aClock now.
	clientId := aClientId.
	! !


!CartSession methodsFor: 'public' stamp: 'AA 7/22/2020 00:15:49'!
add: aNumberOfTimesToAdd of: aBookISBN
 	self updatelastTimeUsed.
	cart add: aNumberOfTimesToAdd of: aBookISBN.! !

!CartSession methodsFor: 'public' stamp: 'AA 7/22/2020 00:23:15'!
checkoutWithCreditCard: aCreditCard andDate: aDate
	cashier 
		checkoutCart: cart 
		withCreditCard: aCreditCard 
		onDate: aDate 
		usingMerchantProcessor: merchantProcessor 
		forClient: clientId.! !

!CartSession methodsFor: 'public' stamp: 'AA 7/22/2020 00:16:10'!
listCart
	self updatelastTimeUsed.
	^cart listOfProducts.! !


!CartSession methodsFor: 'testing' stamp: 'AA 7/21/2020 22:36:34'!
isEmpty
	^cart isEmpty.! !


!CartSession methodsFor: 'time' stamp: 'AA 7/22/2020 00:16:34'!
isExpired
	^(lastTimeUsed+30 minutes) < clock now.! !

!CartSession methodsFor: 'time' stamp: 'AA 7/22/2020 00:15:36'!
updatelastTimeUsed
	lastTimeUsed := clock now.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartSession class' category: #TusLibros!
CartSession class
	instanceVariableNames: ''!

!CartSession class methodsFor: 'instance creation' stamp: 'AA 7/22/2020 00:18:13'!
createWithCashier: aCashier merchantProcessor: aMerchantProcessor client: aClientId clock: dateAndTime cart: aCart
	^self new initializeWithCashier: aCashier merchantProcessor: aMerchantProcessor client: aClientId dateAndTime: dateAndTime cart: aCart! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook saleId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'validations' stamp: 'AAB 7/11/2020 19:10:42'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self error: self class cantCheckoutAnEmptyCartErrorMessage]! !

!Cashier methodsFor: 'validations' stamp: 'AAB 7/13/2020 20:46:15'!
assertCreditCardIsNotExpired: aCreditCard onDate: aMonthYear

	^ (aCreditCard isExpiredOn: aMonthYear) ifTrue: [self error: self class cantCheckoutWithExpiredCreditCardErrorMessage ]! !

!Cashier methodsFor: 'validations' stamp: 'AA 7/22/2020 22:49:55'!
assertTotalDoesntExceedMaximumTransactionAmmount: totalPriceOfProducts

	^ (totalPriceOfProducts decimalDigitLength > 15) ifTrue: [self error: self class excededMaximumTransactionAmmountErrorDescription]! !


!Cashier methodsFor: 'initialization' stamp: 'AA 7/22/2020 22:26:28'!
initializeWith: aSalesBook 

	salesBook := aSalesBook.
	saleId := 0.! !


!Cashier methodsFor: 'checkout' stamp: 'AA 7/22/2020 22:49:55'!
checkoutCart: aCart withCreditCard: aCreditCard onDate: aDate usingMerchantProcessor: aMerchantProcessorSimulator forClient: aClient
	
	| totalPriceOfProducts sale |
	
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard onDate: aDate.
	
	totalPriceOfProducts := aCart totalPriceOfProducts.
	
	self assertTotalDoesntExceedMaximumTransactionAmmount: totalPriceOfProducts. 
	aMerchantProcessorSimulator debit: totalPriceOfProducts from: aCreditCard.
	
	
	
	sale := Sale of: aCart listOfProducts withATotal: totalPriceOfProducts madeIn: aDate using: aCreditCard.
	
	salesBook addSale: sale purchasedBy: aClient . 
	aCart emptyCart.
	saleId := saleId +1.
	^saleId-1
! !


!Cashier methodsFor: 'sales book' stamp: 'AA 7/21/2020 23:06:23'!
lastSale: aClientId
	
	^ salesBook lastSale: aClientId! !

!Cashier methodsFor: 'sales book' stamp: 'AA 7/21/2020 23:29:53'!
listPurchasesOf: aClientId
	^salesBook listPurchasesOf: aClientId. ! !

!Cashier methodsFor: 'sales book' stamp: 'AA 7/21/2020 22:55:38'!
salesBookIsEmpty: aClient
	
	^salesBook isEmpty: aClient! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 15:18:28'!
cantCheckoutAnEmptyCartErrorMessage
	
	^'Cant checkout an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 18:30:02'!
cantCheckoutWithExpiredCreditCardErrorMessage
	
	^ 'Cant checkout with an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'AA 7/22/2020 22:50:52'!
excededMaximumTransactionAmmountErrorDescription
	^'exceded maximum transaction ammount'! !


!Cashier class methodsFor: 'instance creation' stamp: 'AAB 7/15/2020 23:23:17'!
with: aSalesBook
	
	^ self new initializeWith: aSalesBook.! !


!classDefinition: #ClockSimulator category: #TusLibros!
Object subclass: #ClockSimulator
	instanceVariableNames: 'dateAndTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ClockSimulator methodsFor: 'initialization' stamp: 'AA 7/21/2020 21:31:30'!
initializeWith: aDateAndTime
	dateAndTime := aDateAndTime.! !


!ClockSimulator methodsFor: 'time operations' stamp: 'AA 7/21/2020 21:32:18'!
forwardTime: aTime
	dateAndTime  := dateAndTime + aTime.! !

!ClockSimulator methodsFor: 'time operations' stamp: 'AA 7/21/2020 21:32:39'!
now
	^dateAndTime! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ClockSimulator class' category: #TusLibros!
ClockSimulator class
	instanceVariableNames: ''!

!ClockSimulator class methodsFor: 'instance creation' stamp: 'AAB 7/23/2020 14:45:48'!
createWith: aDateAndTime
	^self new initializeWith: aDateAndTime .! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'number ownerName expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'AAB 7/11/2020 16:34:17'!
initializeWIthNumber: creditCardNumber owner: creditCardOwnerName andExpiration: creditCardExpiration 

	number := creditCardNumber.
	ownerName := creditCardOwnerName.
	expiration := creditCardExpiration.! !


!CreditCard methodsFor: 'testing' stamp: 'AAB 7/11/2020 16:34:56'!
creditCardExpiration
	
	^expiration ! !

!CreditCard methodsFor: 'testing' stamp: 'AAB 7/11/2020 16:34:35'!
creditCardNumber
	
	^ number ! !

!CreditCard methodsFor: 'testing' stamp: 'AAB 7/11/2020 16:34:45'!
creditCardOwnerName
	
	^ownerName ! !


!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/20/2020 14:03:47'!
expiredAPreviousYear: aDate
	
	^ aDate > expiration yearNumber! !

!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/20/2020 14:03:42'!
expiredOnYear: aDate
	
	^ (aDate yearNumber = expiration yearNumber) and: [aDate monthIndex > expiration monthIndex ]  ! !

!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/20/2020 14:03:35'!
isExpiredOn: aDate
	
	^ (self expiredAPreviousYear: aDate yearNumber) or: [self expiredOnYear: aDate ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'validations' stamp: 'AAB 7/11/2020 18:16:23'!
assertIsAValidCreditCardExpiration: creditCardExpirationAsString

	| month |

	creditCardExpirationAsString size = 6 ifFalse: [self error: self creditCardExpirationMustHaveSixDigitsErrorMessage].
	(creditCardExpirationAsString allSatisfy: [:each | each isDigit ]) ifFalse: [self error: self creditCardExpirationMustBeAValidExpirationErrorMessage ].
	month := (self monthFromString: creditCardExpirationAsString ) asInteger.
	(month between: 1 and: 12 ) ifFalse: [self error: self creditCardExpirationMustBeAValidExpirationErrorMessage ]! !

!CreditCard class methodsFor: 'validations' stamp: 'AAB 7/11/2020 17:35:03'!
assertIsAValidCreditCardName: creditCardOwnerName

	(creditCardOwnerName includesSubString: ' ') ifFalse: [self error: self creditCardNameMustBeAValidFullNameErrorMessage].
	creditCardOwnerName = (creditCardOwnerName withBlanksCondensed) ifFalse: [self error: self creditCardNameMustBeAValidFullNameErrorMessage].
	(creditCardOwnerName size <= 30) ifFalse: [self error: self creditCardNameMustHaveThirtyCharactersOrLessErrorMessage].
	(creditCardOwnerName allSatisfy: [:each | (each isLetter) or: (each = $ ) ]) ifFalse: [self error: self creditCardNameMustBeAValidFullNameErrorMessage]! !

!CreditCard class methodsFor: 'validations' stamp: 'AAB 7/11/2020 17:01:24'!
assertIsValidCreditCardNumber: creditCardNumberAsString

	(creditCardNumberAsString size = 16) ifFalse: [self error: self creditCardNumberMustHave16DigitsErrorMessage].
	(creditCardNumberAsString allSatisfy: [:each | each isDigit ]) ifFalse: [self error: self creditCardNumberMustHave16DigitsErrorMessage]! !


!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 17:59:24'!
creditCardExpirationMusBeAValidExpirationDateErrorMessage
	self shouldBeImplemented.! !

!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 18:05:59'!
creditCardExpirationMustBeAValidExpirationErrorMessage
	
	^'Credit card expiration must be a valid expiration'! !

!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 18:02:55'!
creditCardExpirationMustHaveSixDigitsErrorMessage
	
	^'Credit card must have six digits'! !

!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 17:13:47'!
creditCardNameMustBeAValidFullNameErrorMessage
	
	^'Credit card name must be a valid full name'! !

!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 17:25:31'!
creditCardNameMustHaveThirtyCharactersOrLessErrorMessage
	
	^'Credit card name must have 30 characters or less'! !

!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 16:53:56'!
creditCardNumberMustHave16DigitsErrorMessage
	
	^'Credit card number must have 16 digits'! !

!CreditCard class methodsFor: 'error messages' stamp: 'AAB 7/11/2020 16:49:37'!
invalidCreditCardErrorMessage
	
	^'Invalid credit card'! !


!CreditCard class methodsFor: 'instance creation' stamp: 'AAB 7/11/2020 18:13:56'!
withNumber: creditCardNumberAsString ofOwner: creditCardOwnerName withExpiration: creditCardExpirationAsString 

	| creditCardNumber numberOfMonthOfExpiration numberOfYearOfExpiration monthOfYearExpiration|
	
	self assertIsValidCreditCardNumber: creditCardNumberAsString.
	self assertIsAValidCreditCardName: creditCardOwnerName.
	self assertIsAValidCreditCardExpiration: creditCardExpirationAsString.
	
	creditCardNumber := creditCardNumberAsString asInteger.
	numberOfMonthOfExpiration := self monthFromString: creditCardExpirationAsString.
	numberOfYearOfExpiration := creditCardExpirationAsString withoutPrefix: numberOfMonthOfExpiration.
	monthOfYearExpiration := Month month: (numberOfMonthOfExpiration asInteger ) year: (numberOfYearOfExpiration asInteger).
	
	^ self new initializeWIthNumber: creditCardNumber owner: creditCardOwnerName andExpiration: monthOfYearExpiration! !


!CreditCard class methodsFor: 'convertions' stamp: 'AAB 7/11/2020 18:13:56'!
monthFromString: creditCardExpirationAsString

	^ creditCardExpirationAsString truncateTo: 2! !


!classDefinition: #InterfazTusLibros category: #TusLibros!
Object subclass: #InterfazTusLibros
	instanceVariableNames: 'authenticationSystem authenticationSystemSimulator priceList cartSessionsById availableCartId cashier merchantProcessor clientOfCart tusLibrosSalesBook clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfazTusLibros methodsFor: 'initialization' stamp: 'AA 7/21/2020 22:16:58'!
initializeWithAuthenticationSystem: anAuthenticationSystemSimulator priceList: aPriceList cashier: aCashier merchantProcessor: aMerchantProcessor clock: aClock

	authenticationSystem := anAuthenticationSystemSimulator.
	priceList := aPriceList.
	cashier := aCashier.
	merchantProcessor := aMerchantProcessor.
	cartSessionsById := Dictionary new.
	availableCartId := 0.
	clientOfCart := Dictionary new.
	tusLibrosSalesBook := SalesBook new.
	clock := aClock.! !


!InterfazTusLibros methodsFor: 'cartId' stamp: 'AA 7/21/2020 22:16:01'!
increaseCartId
	
	availableCartId := availableCartId + 1.! !

!InterfazTusLibros methodsFor: 'cartId' stamp: 'AA 7/21/2020 22:16:58'!
isValidCartId: aCartId

	^ cartSessionsById at: aCartId ifAbsent: [self error: self class invalidCartIdErrorMessage ]! !

!InterfazTusLibros methodsFor: 'cartId' stamp: 'AAB 7/19/2020 17:08:56'!
previousCartId
	
	^ availableCartId - 1.! !


!InterfazTusLibros methodsFor: 'cartSession' stamp: 'AA 7/22/2020 00:18:54'!
createCartSession: aClientId
	|cartSession|
	cartSession := CartSession createWithCashier: cashier merchantProcessor: merchantProcessor client: aClientId clock: clock cart: (Cart acceptingItemsOf: priceList).
	cartSessionsById at: availableCartId put: (cartSession)! !

!InterfazTusLibros methodsFor: 'cartSession' stamp: 'AA 7/22/2020 00:17:07'!
isExpiredCartid: aCartId
	((cartSessionsById at: aCartId ) isExpired) ifTrue:
	 [
		cartSessionsById removeKey: aCartId. 
		self error: self class cartExpiredErrorMessage.
	]! !


!InterfazTusLibros methodsFor: 'authentification' stamp: 'AA 7/21/2020 23:20:28'!
authenticateClient: aClientId withPassword: aPassword

	(authenticationSystem isValidClient: aClientId) ifFalse: [ ^ self error: self class invalidClientIdErrorMessage ].
	(authenticationSystem isValidPassword: aPassword forClient: aClientId) ifFalse: [^ self error: self class wrongPasswordErrorMessage].! !


!InterfazTusLibros methodsFor: 'public' stamp: 'AA 7/22/2020 00:14:57'!
addToCart: aCartId aQuantity: aNumberOfTimesToAdd ofBookISBN: aBookISBN
	|cartSession|
	self isValidCartId: aCartId.
	self isExpiredCartid: aCartId .
	
	cartSession := (cartSessionsById at: aCartId).
	cartSession add: aNumberOfTimesToAdd of: aBookISBN.
	! !

!InterfazTusLibros methodsFor: 'public' stamp: 'AA 7/21/2020 23:58:36'!
checkoutCart: aCartId withCardNumber: aCreditCardNumber ofOwner: aCreditCardOwnerName withExpiration: anExpiration onDate: aDate
	| creditCard cartSessionToCheckout|
	
	self isValidCartId: aCartId.
	self isExpiredCartid: aCartId.
	creditCard := CreditCard withNumber: aCreditCardNumber ofOwner: aCreditCardOwnerName withExpiration: anExpiration. 
	cartSessionToCheckout := cartSessionsById at: aCartId.
		
	cartSessionToCheckout checkoutWithCreditCard: creditCard andDate: aDate.
	
	cartSessionsById removeKey: aCartId.! !

!InterfazTusLibros methodsFor: 'public' stamp: 'AA 7/21/2020 23:20:48'!
createCartWithClientId: aClientId andPassword: aPassword 
	self authenticateClient: aClientId withPassword: aPassword.
	
	self createCartSession: aClientId.
	self increaseCartId.
	^ self previousCartId.
	! !

!InterfazTusLibros methodsFor: 'public' stamp: 'AA 7/21/2020 23:49:00'!
listCart: aCartId
	self isValidCartId: aCartId.
	self isExpiredCartid: aCartId.
	^ (cartSessionsById at: aCartId ) listCart.! !

!InterfazTusLibros methodsFor: 'public' stamp: 'AA 7/21/2020 23:22:14'!
listPurchasesOfClient: aClientId withPassword: aPassword
	
	self authenticateClient: aClientId withPassword: aPassword.

	^cashier listPurchasesOf: aClientId.! !


!InterfazTusLibros methodsFor: 'testing' stamp: 'AA 7/21/2020 22:16:58'!
cartWithIdIsEmpty: aCartId
	
	^ (cartSessionsById at: aCartId) isEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InterfazTusLibros class' category: #TusLibros!
InterfazTusLibros class
	instanceVariableNames: ''!

!InterfazTusLibros class methodsFor: 'error messages' stamp: 'AA 7/21/2020 21:48:31'!
cartExpiredErrorMessage
	^'cart expired'! !

!InterfazTusLibros class methodsFor: 'error messages' stamp: 'AAB 7/19/2020 17:16:35'!
invalidCartIdErrorMessage
	
	^ 'Invalid cart Id'! !

!InterfazTusLibros class methodsFor: 'error messages' stamp: 'AAB 7/19/2020 15:57:28'!
invalidClientIdErrorMessage
	
	^ 'Invalid client Id' ! !

!InterfazTusLibros class methodsFor: 'error messages' stamp: 'AAB 7/19/2020 16:07:04'!
wrongPasswordErrorMessage
	
	^ 'Wrong password'! !


!InterfazTusLibros class methodsFor: 'instance creation' stamp: 'AA 7/21/2020 21:45:08'!
createWithAuthenticationSystem: anAuthenticationSystemSimulator priceList: aPriceList cashier: aCashier merchantProcessor: aMerchantProcessor clock: aClock
	
	^ self new initializeWithAuthenticationSystem: anAuthenticationSystemSimulator priceList: aPriceList cashier: aCashier merchantProcessor: aMerchantProcessor clock: aClock.! !


!classDefinition: #MerchantProcessor category: #TusLibros!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'response' stamp: 'AAB 7/15/2020 23:47:34'!
debit: anAmount from: aCreditCard 
	
	self subclassResponsibility.! !


!MerchantProcessor methodsFor: 'initialization' stamp: 'AAB 7/15/2020 23:48:23'!
initializeWith: aBlockClosure 
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: #TusLibros!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error messages' stamp: 'AAB 7/15/2020 23:47:16'!
expiredCreditCardErrorDescription
	
	^ 'Cant debit from an expired credit card'! !

!MerchantProcessor class methodsFor: 'error messages' stamp: 'AAB 7/15/2020 23:47:08'!
notEnoughFundsErrorDescription
	
	^ 'Not enough funds in credit card'! !

!MerchantProcessor class methodsFor: 'error messages' stamp: 'AAB 7/15/2020 23:46:59'!
stolenCardErrorDescription

	^ 'Can not debit from a stolen card'! !


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
MerchantProcessor subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'behaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'response' stamp: 'AAB 7/15/2020 22:37:14'!
debit: anAmount from: aCreditCard 
	
	behaviour value.! !


!MerchantProcessorSimulator methodsFor: 'initialization' stamp: 'AAB 7/15/2020 22:32:38'!
initializeWith: aBlockClosure 
	
	behaviour := aBlockClosure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: #TusLibros!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'AAB 7/15/2020 22:31:36'!
createWith: aBlockClosure 
	
	^ self new initializeWith: aBlockClosure.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'amount date creditCard productsSold total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'initialization' stamp: 'AAB 7/20/2020 14:33:38'!
initializeWithProducts: products costing: anAmount madeIn: aDate using: aCreditCard 
	
	productsSold := products.
	total := anAmount.
	date := aDate.
	creditCard := aCreditCard.! !


!Sale methodsFor: 'values' stamp: 'AA 7/22/2020 00:35:35'!
creditCard
	^creditCard.! !

!Sale methodsFor: 'values' stamp: 'AA 7/22/2020 00:35:18'!
date
	^date! !

!Sale methodsFor: 'values' stamp: 'AAB 7/20/2020 11:16:09'!
productsSold
	
	^ productsSold copy! !

!Sale methodsFor: 'values' stamp: 'AAB 7/20/2020 10:56:57'!
total
	
	^total! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'AAB 7/20/2020 14:33:49'!
of: products withATotal: anAmount madeIn: aDate using: aCreditCard 

	^self new initializeWithProducts: products costing: anAmount madeIn: aDate using: aCreditCard ! !


!classDefinition: #SalesBook category: #TusLibros!
Object subclass: #SalesBook
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SalesBook methodsFor: 'add sale' stamp: 'AA 7/21/2020 23:03:00'!
addSale: aSale purchasedBy: aClientId 
	
	
	(salesBook at: aClientId ifAbsentPut: [OrderedCollection new]).
	(salesBook at: aClientId ) addLast: aSale.
! !


!SalesBook methodsFor: 'initialization' stamp: 'AAB 7/20/2020 14:37:23'!
initialize
	
	salesBook := Dictionary new! !


!SalesBook methodsFor: 'purchases' stamp: 'AA 7/21/2020 23:08:18'!
lastSale: aClientId
	salesBook at: aClientId ifAbsent: [self error: self class clientHasntBoughtProductsErrorMessage ].
	
	^(salesBook at: aClientId) last copy. ! !

!SalesBook methodsFor: 'purchases' stamp: 'AA 7/21/2020 23:41:48'!
listPurchasesOf: aClientId

	| productsBoughtInAllPurchases totalOfProductsBoughtInAllPurchases  listPurchases|
	listPurchases := Dictionary new.
	salesBook at: aClientId ifAbsent: 
	[
		listPurchases at: 'products' put: Bag new.
		listPurchases at: 'total' put: 0.
		^listPurchases.
	].
	
	productsBoughtInAllPurchases := self productsBoughtBy: aClientId.
	totalOfProductsBoughtInAllPurchases := (self totalOfProductsBoughtBy: aClientId).
	
	listPurchases at: 'products' put: productsBoughtInAllPurchases.
	listPurchases at: 'total' put: totalOfProductsBoughtInAllPurchases.
	
	
	^ listPurchases.
	
	! !

!SalesBook methodsFor: 'purchases' stamp: 'AA 7/21/2020 23:25:44'!
productsBoughtBy: aClientId

	| sales productsBoughtInAllPurchases |
	
	sales := salesBook at: aClientId.
	productsBoughtInAllPurchases := Bag new.

	sales do: [:sale | 
		productsBoughtInAllPurchases addAll: sale productsSold.
	].
	
	^ productsBoughtInAllPurchases
	
	! !

!SalesBook methodsFor: 'purchases' stamp: 'AA 7/21/2020 23:03:14'!
totalOfProductsBoughtBy: aClientId

	| sales totalOfProductsBoughtInAllPurchases|
	
	sales := salesBook at: aClientId .
	totalOfProductsBoughtInAllPurchases := 0.

	sales do: [:sale | 
		totalOfProductsBoughtInAllPurchases := totalOfProductsBoughtInAllPurchases + sale total.
	].
	
	^ totalOfProductsBoughtInAllPurchases.
	
	! !


!SalesBook methodsFor: 'testing' stamp: 'AA 7/21/2020 22:55:10'!
isEmpty: aClientId
	salesBook at: aClientId ifAbsent: [^true].
	
	^false. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SalesBook class' category: #TusLibros!
SalesBook class
	instanceVariableNames: ''!

!SalesBook class methodsFor: 'error message' stamp: 'AAB 7/20/2020 15:16:09'!
clientHasntBoughtProductsErrorMessage
	
	^'Client hasnt bought products'! !
