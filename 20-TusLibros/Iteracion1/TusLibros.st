!classDefinition: #ShoppingCartTest category: #TusLibros!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShoppingCartTest methodsFor: 'empty' stamp: 'AA 7/4/2020 16:10:07'!
test01NewShoppingCartIsEmpty
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	
	self assert: shoppingCart isEmpty.! !

!ShoppingCartTest methodsFor: 'empty' stamp: 'AA 7/4/2020 16:21:13'!
test02ShoppingCartWithOneProductIsNotEmpty
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	shoppingCart  addProductToCart: '123'.
	self deny: shoppingCart isEmpty.! !


!ShoppingCartTest methodsFor: 'product quantity' stamp: 'AA 7/4/2020 16:21:13'!
test03ShoppingCartWithOneProductHasThatProducts
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	shoppingCart  addProductToCart: '123'.
	self assert: 1 equals: (shoppingCart quantityOfItem: '123').! !

!ShoppingCartTest methodsFor: 'product quantity' stamp: 'AA 7/4/2020 16:11:19'!
test04EmptyShoppingCartDoesntHaveProducts
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	
	self assert: 0 equals: (shoppingCart quantityOfItem: '123').! !

!ShoppingCartTest methodsFor: 'product quantity' stamp: 'AA 7/4/2020 16:22:09'!
test05ShoppingCartHasMoreThanOneProductWhenAddedMoreThanOneProduct
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	shoppingCart  addProductToCart: '123' quantity:2.
	self assert: 2 equals: (shoppingCart quantityOfItem: '123').! !

!ShoppingCartTest methodsFor: 'product quantity' stamp: 'AA 7/4/2020 16:21:13'!
test06NonEmptyShoppingCartDoesntHaveAProductThatWasntAdded
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	shoppingCart  addProductToCart: '123'.
	self assert: 0 equals: (shoppingCart quantityOfItem: '1234').! !


!ShoppingCartTest methodsFor: 'restrictions to products add' stamp: 'AA 7/4/2020 16:22:14'!
test07CantAddNonPositiveAmountOfProducts
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	
	self should:[shoppingCart  addProductToCart: '123' quantity:-1.] 
	raise: Error withMessageText: ShoppingCart theQuantityOfTheProductBeingAddedToTheShoppingCartMustBePositiveErrorSignal.! !


!ShoppingCartTest methodsFor: 'list of product' stamp: 'AA 7/4/2020 16:13:46'!
test08ListOfProductsOfEmptyShoppingCartIsEmpty
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	
	self assert: '' equals: shoppingCart listOfProducts .! !

!ShoppingCartTest methodsFor: 'list of product' stamp: 'AA 7/4/2020 16:22:19'!
test09ListOfProductsOfShoppingCartWithOneItemHasCodeAndAmmount
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	shoppingCart addProductToCart: '123' quantity: 1.
	self assert: '|123|1' equals: shoppingCart listOfProducts .! !

!ShoppingCartTest methodsFor: 'list of product' stamp: 'AA 7/4/2020 16:22:22'!
test10ListOfProductsOfNonEmptyShoppingCartHasCodeAndAmmount
	|shoppingCart|
	
	shoppingCart := ShoppingCart new.
	shoppingCart addProductToCart: '123' quantity: 33.
	shoppingCart addProductToCart: '321' quantity: 23.
	shoppingCart  addProductToCart: '12321312312' quantity: 13.
	
	self assert: '|12321312312|13|321|23|123|33' equals: shoppingCart listOfProducts .! !


!classDefinition: #ShoppingCart category: #TusLibros!
Object subclass: #ShoppingCart
	instanceVariableNames: 'productsInShoppingCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShoppingCart methodsFor: 'add product' stamp: 'AA 7/4/2020 16:21:13'!
addProductToCart: aProductCode 
	productsInShoppingCart add: aProductCode .! !

!ShoppingCart methodsFor: 'add product' stamp: 'AA 7/4/2020 16:23:19'!
addProductToCart: aProductCode quantity: aNumberOfProductsToAdd
	self quantityIsAValidAmountOfProductToAdd: aNumberOfProductsToAdd.
	productsInShoppingCart add: aProductCode withOccurrences: aNumberOfProductsToAdd.! !

!ShoppingCart methodsFor: 'add product' stamp: 'AA 7/4/2020 16:23:19'!
quantityIsAValidAmountOfProductToAdd: aNumberOfProductsToAdd

	^ aNumberOfProductsToAdd < 1 ifTrue: [self error: self class theQuantityOfTheProductBeingAddedToTheShoppingCartMustBePositiveErrorSignal ]! !


!ShoppingCart methodsFor: 'testing' stamp: 'AA 7/4/2020 15:01:52'!
isEmpty
	^(productsInShoppingCart size<=0).! !

!ShoppingCart methodsFor: 'testing' stamp: 'AA 7/4/2020 16:03:29'!
listOfProducts
	^productsInShoppingCart asSet inject: '' into: [:accum :object  | accum,'|',object asString ,'|', (productsInShoppingCart occurrencesOf: object)  asString] .
	
	
	! !

!ShoppingCart methodsFor: 'testing' stamp: 'AA 7/4/2020 14:59:26'!
quantityOfItem: aProductCode 
	^productsInShoppingCart occurrencesOf: aProductCode .! !


!ShoppingCart methodsFor: 'initialization' stamp: 'AA 7/4/2020 15:01:41'!
initialize
	productsInShoppingCart := Bag new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: #TusLibros!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'error messages' stamp: 'AA 7/4/2020 15:15:04'!
theQuantityOfTheProductBeingAddedToTheShoppingCartMustBePositiveErrorSignal
	^'can only add positive quantity of products to shopping cart'! !
