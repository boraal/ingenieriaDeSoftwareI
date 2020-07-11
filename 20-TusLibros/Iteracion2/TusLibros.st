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

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:12:06'!
test01CantCheckoutAnEmptyCart 
	|aCashier aCart aCreditCard| 
	
	aCashier := Cashier new. 
	aCart := Cart acceptingItemsOf: (Array new). 
	aCreditCard := self creditCard.

	self 
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError| 
			self assert: anError messageText = Cashier cantCheckoutAnEmptyCartErrorMessage.
			 self assert: aCashier purchaseListIsEmpty. 
		] ! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:12:15'!
test02PurchaseListIsNotEmptyAfterAValidCheckout
	|aCashier aCart priceList aCreditCard | 
	
	aCashier := Cashier new.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.

	aCart add: 'validBook'.
	
	self assert: 15 equals: (aCashier checkoutCart: aCart withCreditCard: aCreditCard).
	self deny: aCashier purchaseListIsEmpty.! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:12:25'!
test03CartIsEmptyAfterAValidCheckout

	|aCashier aCart priceList aCreditCard | 
	
	aCashier := Cashier new.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.

	
	aCart add: 'validBook'.
	aCashier checkoutCart: aCart withCreditCard: aCreditCard.
	
	self assert: aCart isEmpty.! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:02:08'!
test04CantCheckoutWithAnExpiredCreditCard

	|aCashier aCart priceList aCreditCard| 
	
	aCashier := Cashier new.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '052020'.
	
	aCart add: 'validBook'.
	
	self
		should: [aCashier checkoutCart: aCart withCreditCard: aCreditCard ] 
		raise: Error 
		withExceptionDo: [:anError |
			self assert: anError messageText = Cashier cantCheckoutWithExpiredCreditCardErrorMessage.
			self assert: aCashier purchaseListIsEmpty.
			self deny: aCart isEmpty.
		]
! !

!CashierTest methodsFor: 'tests' stamp: 'AAB 7/11/2020 19:42:34'!
test05PurchaseListContainsItemsSoldInCorrectFormat
	|aCashier aCart priceList aCreditCard | 
	
	aCashier := Cashier new.
	priceList := Dictionary new.
	priceList add: (Association key: 'validBook' value: 15).
	priceList add: (Association key: 'anotherValidBook' value: 10).
	aCart := Cart acceptingItemsOf: priceList.
	aCreditCard := self creditCard.

	aCart add: 4 of: 'validBook'.
	aCart add: 2 of: 'anotherValidBook'.
	
	aCashier checkoutCart: aCart withCreditCard: aCreditCard.
	
	self assert: '|anotherValidBook|2|validBook|4|80' equals: (aCashier lastPurchase).
! !


!CashierTest methodsFor: 'setUp' stamp: 'AAB 7/11/2020 19:11:56'!
creditCard

	^CreditCard withNumber: '0123012301230123' ofOwner: 'Pepe Sanchez' withExpiration: '122020'.	! !


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


!Cart methodsFor: 'as yet unclassified' stamp: 'AAB 7/11/2020 16:08:51'!
emptyCart
	
	items := OrderedCollection new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AAB 7/11/2020 19:31:47'!
listOfItems

	^ (self listOfProducts) ,'|', (self totalPriceOfProducts asString)
	! !

!Cart methodsFor: 'as yet unclassified' stamp: 'AAB 7/11/2020 19:41:20'!
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'AAB 7/11/2020 15:34:34'!
acceptingItemsOf: aPriceList

	^self new initializeAcceptingItemsOf: aPriceList ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'purchaseList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'merchant processor' stamp: 'AAB 7/11/2020 19:09:55'!
sendToMerchantProcessor: aCreditCard

! !


!Cashier methodsFor: 'validations' stamp: 'AAB 7/11/2020 19:10:42'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self error: self class cantCheckoutAnEmptyCartErrorMessage]! !

!Cashier methodsFor: 'validations' stamp: 'AAB 7/11/2020 19:10:56'!
assertCreditCardIsNotExpired: aCreditCard

	^ aCreditCard isExpired ifTrue: [self error: self class cantCheckoutWithExpiredCreditCardErrorMessage ]! !


!Cashier methodsFor: 'initialization' stamp: 'AAB 7/11/2020 19:39:23'!
initialize

	purchaseList := OrderedCollection new.! !


!Cashier methodsFor: 'checkout' stamp: 'AAB 7/11/2020 19:46:15'!
checkoutCart: aCart withCreditCard: aCreditCard 
	
	| totalPriceOfProducts |
	
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard.
	
	self sendToMerchantProcessor: aCreditCard .
	totalPriceOfProducts := aCart totalPriceOfProducts.
	self addLastPurchaseToPurchaseList: aCart.
	
	aCart emptyCart.
	^totalPriceOfProducts.

	
	! !


!Cashier methodsFor: 'purchase list' stamp: 'AAB 7/11/2020 19:46:15'!
addLastPurchaseToPurchaseList: aCart

	^ purchaseList addLast: aCart listOfItems! !

!Cashier methodsFor: 'purchase list' stamp: 'AAB 7/11/2020 19:38:46'!
lastPurchase
	
	^ purchaseList at: (purchaseList size)! !

!Cashier methodsFor: 'purchase list' stamp: 'AAB 7/11/2020 19:43:10'!
purchaseListIsEmpty
	
	^purchaseList isEmpty! !

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


!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/11/2020 18:59:20'!
expiredAPreviousYear

	| today |
	
	today := Date today.

	^(expiration yearNumber < today yearNumber)! !

!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/11/2020 18:59:47'!
expiredThisYear

	| today |
	
	today := Date today.

	^((today yearNumber = expiration yearNumber) and: (expiration monthIndex < today monthIndex))! !

!CreditCard methodsFor: 'expiration' stamp: 'AAB 7/11/2020 19:00:18'!
isExpired
	
	^ (self expiredThisYear) or: (self expiredAPreviousYear).! !

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
