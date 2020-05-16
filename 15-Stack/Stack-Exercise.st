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


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackAsNodeList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'AA 5/16/2020 17:58:31'!
initialize
	stackAsNodeList := OrderedCollection new.
	stackAsNodeList addLast: NodoEmpty new! !


!OOStack methodsFor: 'stack basic operations' stamp: 'AA 5/16/2020 17:55:28'!
pop
	|topElement|
	topElement := stackAsNodeList first top.
	stackAsNodeList removeFirst.
	^topElement 
	 ! !

!OOStack methodsFor: 'stack basic operations' stamp: 'AA 5/16/2020 17:58:21'!
push: aNewStackElement
	stackAsNodeList addFirst: (NodoWithElement createWith: aNewStackElement) ! !

!OOStack methodsFor: 'stack basic operations' stamp: 'AA 5/16/2020 17:55:28'!
top
	^stackAsNodeList first top! !


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


!classDefinition: #NodoEmpty category: #'Stack-Exercise'!
OOStack subclass: #NodoEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodoEmpty methodsFor: 'initialization' stamp: 'AA 5/16/2020 16:51:28'!
initialize! !


!NodoEmpty methodsFor: 'stack basic operations' stamp: 'AA 5/16/2020 15:57:57'!
top
	^self error: self class stackEmptyErrorDescription ! !


!NodoEmpty methodsFor: 'testing' stamp: 'AA 5/16/2020 16:01:12'!
isEmpty
	^true! !


!classDefinition: #NodoWithElement category: #'Stack-Exercise'!
OOStack subclass: #NodoWithElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodoWithElement methodsFor: 'initialization' stamp: 'AA 5/16/2020 16:53:26'!
initialize! !

!NodoWithElement methodsFor: 'initialization' stamp: 'AA 5/16/2020 17:53:15'!
initializeWith: aNewStackElement
	value := aNewStackElement 
! !


!NodoWithElement methodsFor: 'stack basic operations' stamp: 'AA 5/16/2020 17:54:23'!
top
	^value! !


!NodoWithElement methodsFor: 'testing' stamp: 'AA 5/16/2020 15:56:50'!
isEmpty
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NodoWithElement class' category: #'Stack-Exercise'!
NodoWithElement class
	instanceVariableNames: ''!

!NodoWithElement class methodsFor: 'as yet unclassified' stamp: 'AA 5/16/2020 16:38:06'!
createWith: aNewStackElement
	^self new initializeWith: aNewStackElement ! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack checkedElementsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'find' stamp: 'AA 5/16/2020 19:16:26'!
findWithPrefix: aPrefix
	|stringsWithThatPrefix|
	stringsWithThatPrefix := OrderedCollection new.
	
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AA 5/16/2020 18:08:17'!
withStack: aOOStack
	^self new initializeWith: aOOStack ! !
