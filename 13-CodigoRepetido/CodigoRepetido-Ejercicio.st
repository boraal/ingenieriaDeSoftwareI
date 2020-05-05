!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:42:02'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self operation: [customerBook addCustomerNamed: 'John Lennon'] ShouldNotTakeMoreMillisecondsThan: 50.

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:42:08'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	paulMcCartney := 'paulMcCartney'.
	customerBook := CustomerBook createCustomerBookWithCustomer: paulMcCartney.
	
	self operation: [customerBook removeCustomerNamed: paulMcCartney] ShouldNotTakeMoreMillisecondsThan: 100.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:42:14'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self onOperation: [ customerBook addCustomerNamed: ''] 
		testError: Error 
		asserting: [:anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:42:23'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook createCustomerBookWithCustomer: johnLennon.

	self onOperation: [ customerBook removeCustomerNamed: 'Paul McCartney'] 
		testError: NotFound  
		asserting: [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon)  ]

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:45:16'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook createCustomerBookWithCustomer: paulMcCartney.

	customerBook suspendCustomerNamed: paulMcCartney.
	
	self inCustomerBookCheck: customerBook expectedActive: 0 expectedSuspended: 1 totalExpectedCustomers: 1.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:45:19'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook createCustomerBookWithCustomer: paulMcCartney.
	
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self inCustomerBookCheck: customerBook expectedActive: 0 expectedSuspended: 0 totalExpectedCustomers: 0.
	
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:42:41'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook createCustomerBookWithCustomer: johnLennon.
	
	self onOperation: [ customerBook suspendCustomerNamed: 'Ringo Starr' ] 
		testError: CantSuspend 
		asserting: [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:42:47'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook createCustomerBookWithCustomer: johnLennon.

	customerBook suspendCustomerNamed: johnLennon.
	
	self onOperation: [ customerBook suspendCustomerNamed: johnLennon ] 
		testError: CantSuspend 
		asserting: [:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
	
! !


!CustomerBookTest methodsFor: 'testing operations' stamp: 'AAB 5/4/2020 21:45:04'!
inCustomerBookCheck: customerBook expectedActive: expectedActive expectedSuspended: expectedSuspended totalExpectedCustomers: totalExpectedCustomers

	self assert: (expectedActive = customerBook numberOfActiveCustomers).
	self assert: (expectedSuspended = customerBook numberOfSuspendedCustomers).
	self assert: (totalExpectedCustomers = customerBook numberOfCustomers).! !

!CustomerBookTest methodsFor: 'testing operations' stamp: 'AAB 5/4/2020 21:25:44'!
onOperation: anOperation testError: errorToTest asserting: asserts

	[ anOperation value. self fail ]
		on: errorToTest 
		do: asserts! !

!CustomerBookTest methodsFor: 'testing operations' stamp: 'AAB 5/4/2020 21:26:05'!
operation: anOperation ShouldNotTakeMoreMillisecondsThan: maximumTime

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	anOperation value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^ self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (maximumTime * millisecond)! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:36:21'!
includesActiveCustomerNamed: customerName

	^(active includes: customerName)! !

!CustomerBook methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:36:31'!
includesCustomerNamed: customerName

	^(self includesActiveCustomerNamed: customerName) or: [ self includesSuspendedCustomerNamed: customerName]! !

!CustomerBook methodsFor: 'testing' stamp: 'AAB 5/4/2020 21:36:37'!
includesSuspendedCustomerNamed: customerName

	^(suspended includes: customerName)! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AAB 5/4/2020 21:35:25'!
addCustomerNamed: customerName

	self canAddCustomer: customerName.
	
	active add: customerName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AAB 5/4/2020 21:35:39'!
canAddCustomer: customerName

	customerName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	[self includesCustomerNamed: customerName] value ifTrue: [ self signalCustomerAlreadyExists ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AA 5/1/2020 06:22:57'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'AAB 5/2/2020 16:30:39'!
removeCustomerNamed: aName 

	((self removeCustomerNamed: aName in: active) or:
	[self removeCustomerNamed: aName in: suspended]) ifTrue: [^aName ].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AAB 5/4/2020 21:41:34'!
removeCustomerNamed: customerName in: customerCategory

	| customerExisted |
	
 	customerExisted := true.
	customerCategory remove: customerName ifAbsent: [customerExisted := false].
	^customerExisted
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AAB 5/4/2020 21:36:07'!
suspendCustomerNamed: customerName 
	
	(self removeCustomerNamed: customerName in: active) ifFalse: [^CantSuspend signal].

	suspended add: customerName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!CustomerBook class methodsFor: 'instance creation' stamp: 'AAB 5/2/2020 16:06:43'!
createCustomerBookWithCustomer: aCustomer

	| customerBook |
	customerBook := CustomerBook new.	
	customerBook addCustomerNamed: aCustomer.
	^customerBook ! !
