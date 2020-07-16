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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:06:34'!
merchantProcessorSimulatorThatAcceptsCard

	^ MerchantProcessorSimulator createWith: ['The credit card was accepted.']! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:44:32'!
test01CantCheckoutAnEmptyCart 
	|aCashier aCart aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook. 
	aCart := Cart acceptingItemsOf: (Array new). 
	aCreditCard := self creditCard.
	aMonthYear := Month month: 1 year: 2020.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| 
			self assert: anError messageText = Cashier cantCheckoutAnEmptyCartErrorMessage.
			 self assert: aCashier salesBookIsEmpty . 
		] ! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:44:52'!
test02PurchaseListIsNotEmptyAfterAValidCheckout
	|aCashier aCart priceList aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook. 
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aMonthYear := Month month: 1 year: 2020.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 'validBook'.
	
	self assert: 15 equals: (aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor ).
	self deny: aCashier salesBookIsEmpty .! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:26:30'!
test03CartIsEmptyAfterAValidCheckout

	|aCashier aCart priceList aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aMonthYear := Month month: 1 year: 2020.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.
	
	aCart add: 'validBook'.
	aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor.
	
	self assert: aCart isEmpty.! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:49:11'!
test04CantCheckoutWithAnExpiredCreditCard

	|aCashier aCart priceList aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook. 
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '052020'.
	aMonthYear := Month month: 6 year: 2020.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 'validBook'.
	
	self
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor ] 
		raise: Error 
		withExceptionDo: [:anError |
			self assert: anError messageText = Cashier cantCheckoutWithExpiredCreditCardErrorMessage.
			self assert: aCashier salesBookIsEmpty .
			self deny: aCart isEmpty.
		]
! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:49:18'!
test05PurchaseListContainsItemsSoldInCorrectFormat
	|aCashier aCart priceList aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aMonthYear := Month month: 1 year: 2020.
	aMerchantProcessor := self merchantProcessorSimulatorThatAcceptsCard.

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor.
	
	self assert: '|anotherValidBook|2|validBook|4|80' equals: (aCashier lastSale).
! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:49:22'!
test06CantCheckoutWithAStolenCreditCard
	|aCashier aCart priceList aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aMonthYear := Month month: 1 year: 2020.
	aMerchantProcessor := MerchantProcessorSimulator createWith: [self error: MerchantProcessorSimulator stolenCardErrorDescription].

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessorSimulator stolenCardErrorDescription.
			self assert: aCashier salesBookIsEmpty.
			self deny: aCart isEmpty.
		]

! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:49:26'!
test07CantCheckoutWithACreditCardThatDoesntHaveEnoughFunds
	|aCashier aCart priceList aCreditCard aMonthYear aMerchantProcessor aSalesBook| 
	
	aSalesBook := self emptySalesBook.
	aCashier := Cashier with: aSalesBook.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.
	aMonthYear := Month month: 1 year: 2020.
	aMerchantProcessor := MerchantProcessorSimulator createWith: [self error: MerchantProcessorSimulator  notEnoughFundsErrorDescription].

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonthYear usingMerchantProcessor: aMerchantProcessor]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessorSimulator notEnoughFundsErrorDescription.
			self assert: aCashier salesBookIsEmpty.
			self deny: aCart isEmpty.
		]

! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/15/2020 23:49:31'!
test08CashierCanReadFromANonEmptySalseBook
	|aCashier aSalesBook| 
	
	aSalesBook := self nonEmptySalesBook.
	aCashier := Cashier with: aSalesBook.
	
	self assert: '|anotherValidBook|2|validBook|4|80' equals: aCashier lastSale.

! !


!CashierTest methodsFor: 'setUp' stamp: 'AAB 7/11/2020 19:11:56'!
creditCard

	^CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.	! !

!CashierTest methodsFor: 'setUp' stamp: 'AAB 7/15/2020 23:22:34'!
emptySalesBook
	
	^ OrderedCollection new.! !

!CashierTest methodsFor: 'setUp' stamp: 'AAB 7/15/2020 23:39:58'!
nonEmptySalesBook
	| salesBook |
	
	salesBook := OrderedCollection new.
	salesBook addLast: '|anotherValidBook|2|validBook|4|80'.
	
	^ salesBook.! !


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


!Cart methodsFor: 'listing items in cart' stamp: 'AAB 7/11/2020 19:31:47'!
listOfItems

	^ (self listOfProducts) ,'|', (self totalPriceOfProducts asString)
	! !

!Cart methodsFor: 'listing items in cart' stamp: 'AAB 7/11/2020 19:41:20'!
listOfProducts

	| bag |
	
	bag := Bag new.
	items do: [:item | bag add: item].
	
	^bag asSet inject: '' into: [:accum :object | accum , '|' , object asString, '|' , (bag occurrencesOf: object) asString].
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


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!Cashier methodsFor: 'validations' stamp: 'AAB 7/11/2020 19:10:42'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self error: self class cantCheckoutAnEmptyCartErrorMessage]! !

!Cashier methodsFor: 'validations' stamp: 'AAB 7/13/2020 20:46:15'!
assertCreditCardIsNotExpired: aCreditCard onDate: aMonthYear

	^ (aCreditCard isExpiredOn: aMonthYear) ifTrue: [self error: self class cantCheckoutWithExpiredCreditCardErrorMessage ]! !


!Cashier methodsFor: 'initialization' stamp: 'AAB 7/15/2020 23:31:05'!
initializeWith: aSalesBook 

	salesBook := aSalesBook.! !


!Cashier methodsFor: 'checkout' stamp: 'AAB 7/15/2020 23:44:06'!
checkoutCart: aCart withCreditCard: aCreditCard onDate: aMonth usingMerchantProcessor: aMerchantProcessorSimulator 
	
	| totalPriceOfProducts |
	
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard onDate: aMonth.
	
	totalPriceOfProducts := aCart totalPriceOfProducts.
	aMerchantProcessorSimulator debit: totalPriceOfProducts from: aCreditCard.
	self addLastSaleToSalesBook: aCart.
	
	aCart emptyCart.
	^totalPriceOfProducts.
! !


!Cashier methodsFor: 'sales book' stamp: 'AAB 7/15/2020 23:44:06'!
addLastSaleToSalesBook: aCart

	^ salesBook addLast: aCart listOfItems! !

!Cashier methodsFor: 'sales book' stamp: 'AAB 7/15/2020 23:43:42'!
lastSale
	
	^ salesBook at: (salesBook size)! !

!Cashier methodsFor: 'sales book' stamp: 'AAB 7/15/2020 23:43:32'!
salesBookIsEmpty
	
	^salesBook isEmpty! !

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


!Cashier class methodsFor: 'instance creation' stamp: 'AAB 7/15/2020 23:23:17'!
with: aSalesBook
	
	^ self new initializeWith: aSalesBook.! !


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


!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/13/2020 20:35:41'!
expiredAPreviousYear: aYearNumber
	
	^ aYearNumber > expiration yearNumber! !

!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/16/2020 14:32:13'!
expiredOnYear: aMonthYear
	
	^ (aMonthYear yearNumber = expiration yearNumber) and: [aMonthYear monthIndex > expiration monthIndex ]  ! !

!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/16/2020 14:31:44'!
isExpiredOn: aMonthDate
	
	^ (self expiredAPreviousYear: aMonthDate yearNumber) or: [self expiredOnYear: aMonthDate ].! !

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
