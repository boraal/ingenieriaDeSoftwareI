!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:52:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 15:38:09'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:52:25'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:52:40'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:53:02'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:53:16'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:53:37'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:53:54'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:54:14'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'AA 5/16/2020 14:54:32'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder elementsWithPrefix stack2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'AA 5/16/2020 20:29:14'!
setUp
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	
	sentenceFinder := SentenceFinderByPrefix  withStack: stack.
	! !


!SentenceFinderByPrefixTest methodsFor: 'test-operations' stamp: 'AA 5/16/2020 20:34:00'!
copyStack: aStack into: orderedCollection
	[aStack isEmpty not] whileTrue: [orderedCollection addFirst: aStack pop].
	
	orderedCollection collect: [:elem |aStack push: elem ].
	
	^orderedCollection! !

!SentenceFinderByPrefixTest methodsFor: 'test-operations' stamp: 'AA 5/16/2020 19:42:14'!
findWithPrefix: aPrefix
	elementsWithPrefix := sentenceFinder findWithPrefix: aPrefix .! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AA 5/16/2020 19:41:14'!
test01ReturnsOneElement
	
	self findWithPrefix: 'The'.
	
	self assert: (elementsWithPrefix size = 1).
	self assert: (elementsWithPrefix first isEqualTo: 'The winds of Winter')! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AA 5/16/2020 19:41:14'!
test02findIsCaseSensitive
		

	self findWithPrefix: 'win'.
	
	self assert: (elementsWithPrefix size = 2).
	self assert: ((elementsWithPrefix at: 1) = 'winning is everything').
	self assert: ((elementsWithPrefix at: 2) = 'winter is coming').

! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AA 5/16/2020 19:41:14'!
test03findReturnsEmptyWhenThereIsNoPrefixCoincidence
	self findWithPrefix: 'wind'.
	
	
	self assert: elementsWithPrefix size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'AA 5/16/2020 20:34:46'!
test04OrderIsMantainedOverManyFinds
	|stackStateBeforeFind stackStateAfterOneFind stackstateAfterTwoFinds|

	stackStateBeforeFind := OrderedCollection new.
	stackStateAfterOneFind  := OrderedCollection  new.
	stackstateAfterTwoFinds  := OrderedCollection  new.
	
	self copyStack: sentenceFinder stack into: stackStateBeforeFind .

	self findWithPrefix: 'win'.
	self copyStack: sentenceFinder stack into: stackStateAfterOneFind  .
	
	self findWithPrefix: 'wind'.
	self copyStack: sentenceFinder stack into: stackstateAfterTwoFinds .
	
	self assert: (stackStateBeforeFind isEqualTo: stackStateAfterOneFind) .
	self assert: (stackStateAfterOneFind  isEqualTo: stackstateAfterTwoFinds )

	
	
	! !


!classDefinition: #NodeOfStack category: #'Stack-Exercise'!
Object subclass: #NodeOfStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodeOfStack methodsFor: 'as yet unclassified' stamp: 'AA 5/18/2020 20:59:08'!
isEmpty
	self subclassResponsibility ! !

!NodeOfStack methodsFor: 'as yet unclassified' stamp: 'AA 5/18/2020 21:00:54'!
value
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NodeOfStack class' category: #'Stack-Exercise'!
NodeOfStack class
	instanceVariableNames: ''!

!NodeOfStack class methodsFor: 'as yet unclassified' stamp: 'AA 5/18/2020 21:06:23'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #EmptyNode category: #'Stack-Exercise'!
NodeOfStack subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyNode methodsFor: 'value' stamp: 'AA 5/18/2020 21:06:01'!
value
	^self error: self class stackEmptyErrorDescription ! !


!EmptyNode methodsFor: 'testing' stamp: 'AA 5/16/2020 16:01:12'!
isEmpty
	^true! !


!classDefinition: #NodeWithElement category: #'Stack-Exercise'!
NodeOfStack subclass: #NodeWithElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodeWithElement methodsFor: 'initialization' stamp: 'AA 5/16/2020 17:53:15'!
initializeWith: aNewStackElement
	value := aNewStackElement 
! !


!NodeWithElement methodsFor: 'Value' stamp: 'AA 5/18/2020 21:00:34'!
value
	^value! !


!NodeWithElement methodsFor: 'testing' stamp: 'AA 5/16/2020 15:56:50'!
isEmpty
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NodeWithElement class' category: #'Stack-Exercise'!
NodeWithElement class
	instanceVariableNames: ''!

!NodeWithElement class methodsFor: 'as yet unclassified' stamp: 'AA 5/16/2020 16:38:06'!
createWith: aNewStackElement
	^self new initializeWith: aNewStackElement ! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackAsNodeList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'AA 5/18/2020 21:03:25'!
initialize
	stackAsNodeList := OrderedCollection new.
	stackAsNodeList addLast: EmptyNode new! !


!OOStack methodsFor: 'stack basic operations' stamp: 'AA 5/18/2020 21:02:20'!
pop
	|topElement|
	topElement := stackAsNodeList first value.
	stackAsNodeList removeFirst.
	^topElement 
	 ! !

!OOStack methodsFor: 'stack basic operations' stamp: 'AA 5/18/2020 21:03:42'!
push: aNewStackElement
	stackAsNodeList addFirst: (NodeWithElement createWith: aNewStackElement) ! !

!OOStack methodsFor: 'stack basic operations' stamp: 'AA 5/18/2020 21:00:25'!
top
	^stackAsNodeList first value! !


!OOStack methodsFor: 'testing' stamp: 'AA 5/16/2020 17:55:27'!
isEmpty
	^(stackAsNodeList first) isEmpty ! !

!OOStack methodsFor: 'testing' stamp: 'AA 5/16/2020 17:55:27'!
size
	^stackAsNodeList size-1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'AA 5/16/2020 15:05:27'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack checkedElementsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'find' stamp: 'AA 5/18/2020 20:51:08'!
findWithPrefix: aPrefix
	|stringsWithThatPrefix|
	stringsWithThatPrefix := OrderedCollection new.
	
	self prefixIsEmpty: aPrefix.


	[(stack isEmpty not)] whileTrue: 
		[self ifTopHasPrefix: aPrefix addTo: stringsWithThatPrefix.
		 self moveTopFromStack: stack to: checkedElementsStack.		 
		 ].
	
	self restoreStack.			
		
	^stringsWithThatPrefix
! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'AA 5/16/2020 19:11:09'!
initializeWith: aOOStack
	stack := aOOStack.
	checkedElementsStack  := OOStack new.
	
	! !


!SentenceFinderByPrefix methodsFor: 'prefix operations' stamp: 'AA 5/16/2020 18:19:52'!
aString: aString isPrefix: aPrefix
	|commonPrefixSize|
	commonPrefixSize := aPrefix commonPrefixWith:  aString.
	^ (commonPrefixSize = aPrefix size)! !

!SentenceFinderByPrefix methodsFor: 'prefix operations' stamp: 'AA 5/16/2020 18:37:13'!
ifTopHasPrefix: aPrefix addTo: anOrderedcollection
	(self topElementHasPrefix: aPrefix) ifTrue: [self addTopToCollection: anOrderedcollection]
	! !

!SentenceFinderByPrefix methodsFor: 'prefix operations' stamp: 'AA 5/16/2020 18:31:46'!
topElementHasPrefix: aPrefix 
	|stackTopElement|
	stackTopElement  := stack top.
	^(self aString: stackTopElement isPrefix: aPrefix)  
	! !


!SentenceFinderByPrefix methodsFor: 'stack operations' stamp: 'AA 5/16/2020 18:36:21'!
addTopToCollection: anOrderedcollection

	^ anOrderedcollection addLast: stack top! !

!SentenceFinderByPrefix methodsFor: 'stack operations' stamp: 'AA 5/16/2020 18:45:43'!
moveTopFromStack: aStackToPop to: aStack
	|topElement|
	topElement := aStackToPop pop.
	aStack push: topElement 
	! !

!SentenceFinderByPrefix methodsFor: 'stack operations' stamp: 'AA 5/16/2020 19:17:43'!
restoreStack
	
	[checkedElementsStack isEmpty not] whileTrue: [ self moveTopFromStack: checkedElementsStack to: stack ]! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'AA 5/16/2020 19:29:51'!
stack
 	^stack ! !


!SentenceFinderByPrefix methodsFor: 'Prefix is valid' stamp: 'AA 5/18/2020 20:50:10'!
prefixIsEmpty: aPrefix
	(aPrefix = '') ifTrue: [^self error: self class prefixCantBeEmpty].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AA 5/18/2020 20:48:52'!
prefixCantBeEmpty
	^'El prefijo no puede ser vacio.'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AA 5/16/2020 18:08:17'!
withStack: aOOStack
	^self new initializeWith: aOOStack ! !
