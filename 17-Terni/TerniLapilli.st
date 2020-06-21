!classDefinition: #TerniLapilliTests category: #TerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:37:41'!
test23CantMoveTokensBeforeAllArePlaced

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	
	self should: [terniLapilli moveTokenAt: (1@1) to: (2@2).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli cantMoveTokenBeforeSixTurnsErrorDescription]


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:38:04'!
test24CantMoveOtherPlayerTokens

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (2@3) to: (3@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli cantMoveOtherPlayerTokenErrorDescription]


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:38:26'!
test25CantMoveTokenToTheSamePosition

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (2@2) to: (2@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:38:43'!
test26CantMoveTokenOverAnotherToken

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (2@2) to: (2@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOverlapErrorDescription ]


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:39:02'!
test27CantMoveTokenOutsideTheBoard

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (2@2) to: (2@4)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription ]


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:39:23'!
test28CantMoveTokenFromOutsideTheBoard

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (2@4) to: (3@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription ]


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:40:18'!
test29CantMoveTokenAfterThereIsAWinner

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (3@3).

	self should: [terniLapilli moveTokenAt: (1@3) to: (2@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli gameFinishedErrorDescription]
! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:40:42'!
test30WhenXMovesTokenItIsOTurn

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli moveTokenAt: (2@2) to: (3@1).
	
	self assert: #O equals: terniLapilli actualPlayer.


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:41:01'!
test31WhenOMovesTokenItIsXTurn

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli moveTokenAt: (2@2) to: (3@1).
	terniLapilli moveTokenAt: (2@3) to: (3@3).
	
	self assert: #X equals: terniLapilli actualPlayer.


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:41:51'!
test32AfterMovingTokenThereIsNoTokenInPreviousPosition

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli moveTokenAt: (2@2) to: (3@1).
	
	self assert: (terniLapilli tokenTypeAt: (2@2)) equals: false.


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:42:17'!
test33AfterMovingTokenItIsInTheNewPosition

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli moveTokenAt: (2@2) to: (3@1).
	
	self assert: (terniLapilli tokenTypeAt: (3@1)) equals: #X.


			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:44:16'!
test34CantMoveTokenFrom11To31

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (1@1) to: (3@1)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:44:27'!
test35CantMoveTokenFrom11To33

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (1@1) to: (3@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:44:33'!
test36CantMoveTokenFrom11To13

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (1@1) to: (1@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:44:40'!
test37CantMoveTokenFrom11To32

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).

	self should: [terniLapilli moveTokenAt: (1@1) to: (3@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/14/2020 18:44:45'!
test38CantMoveTokenFrom11To23

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@1).

	self should: [terniLapilli moveTokenAt: (1@1) to: (2@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:17:15'!
test39CantMoveTokenFrom21To32

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@1).

	self should: [terniLapilli moveTokenAt: (2@1) to: (3@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:20:41'!
test40CantMoveTokenFrom21To12

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@1).

	self should: [terniLapilli moveTokenAt: (2@1) to: (1@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:22:55'!
test41CantMoveTokenFrom12To21

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@2).

	self should: [terniLapilli moveTokenAt: (1@2) to: (2@1)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:24:25'!
test42CantMoveTokenFrom12To23

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@2).

	self should: [terniLapilli moveTokenAt: (1@2) to: (2@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:26:15'!
test43CantMoveTokenFrom23To12

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@2).

	self should: [terniLapilli moveTokenAt: (2@3) to: (1@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:26:37'!
test44CantMoveTokenFrom23To32

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@2).

	self should: [terniLapilli moveTokenAt: (2@3) to: (3@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:27:40'!
test45CantMoveTokenFrom32To21

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@2).

	self should: [terniLapilli moveTokenAt: (3@2) to: (2@1)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AAB 6/15/2020 20:28:27'!
test46CantMoveTokenFrom32To23

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (3@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@2).

	self should: [terniLapilli moveTokenAt: (3@2) to: (2@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
			! !


!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:33:56'!
test13PlayerXWinsOnRowOne

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@3).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:34:10'!
test14PlayerXWinsOnRowTwo

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (2@3).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:34:18'!
test15PlayerXWinsOnRowThree

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@3).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:34:41'!
test16PlayerXWinsOnColumnOne

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@1).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:34:51'!
test17PlayerXWinsOnColumnTwo

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@2).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:35:48'!
test18PlayerXWinsOnColumnThree

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@3).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:36:04'!
test19PlayerXWinsOnDiagonal

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (3@3).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:36:15'!
test20PlayerXWinsOnInverseDiagonal

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (3@1).

	self assert: (terniLapilli winner) equals: #X.

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AAB 6/14/2020 18:36:55'!
test21PlayerOCanWin

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (3@3).

	self assert: (terniLapilli winner) equals: #O.

			! !


!TerniLapilliTests methodsFor: 'test starting conditions' stamp: 'AAB 6/14/2020 18:22:24'!
test01PlayerXStartsPlaying

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	self assert: terniLapilli actualPlayer equals: #X.! !

!TerniLapilliTests methodsFor: 'test starting conditions' stamp: 'AAB 6/14/2020 18:33:00'!
test12ThereIsNoWinnerWhenStarting

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	self assert: terniLapilli winner equals:false.

			! !


!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:48:38'!
test02AfterXPlaceTokenIsOTurn

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@2).
	self assert: terniLapilli actualPlayer equals: #O.! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:48:45'!
test03AfterOPlaceTokenIsXTurn

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@1).
	self assert: terniLapilli actualPlayer equals: #X.! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:24:27'!
test04TokenCanOnlyBePlacedWithHigherThanZeroYCoordinate

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (2@0).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:25:00'!
test05TokenCanOnlyBePlacedWithLowerThanFourYCoordinate

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (1@4).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:25:21'!
test06TokenCanOnlyBePlacedWithLowerThanFourXCoordinate

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (4@1).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:27:01'!
test07TokenCanOnlyBePlacedWithHigherThanZeroXCoordinate

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (0@1).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:27:30'!
test08CantPlaceTokenAboveAnotherToken

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@3).
	
	self should: [terniLapilli placeTokenAt: (1@3)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOverlapErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:31:30'!
test09APlacedTokenByPlayerXIsFromX

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	terniLapilli placeTokenAt: (1@1).
	self assert: (terniLapilli tokenTypeAt: (1@1)) equals: #X.! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:31:40'!
test10APlacedTokenByPlayerOIsFromO

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	self assert: #O equals: (terniLapilli tokenTypeAt: (1@2)).! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:32:27'!
test11OnlySixTokensCanBePlacedOnTheBoard

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	self should: [terniLapilli placeTokenAt: (2@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli noMoreTokensAllowedErrorDescription]

			! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AAB 6/14/2020 18:37:14'!
test22CantPlaceTokenAfterThereIsAWinner

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (3@1).

	self should: [terniLapilli placeTokenAt: (3@2)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli gameFinishedErrorDescription]


			! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'actualPlayer board turn winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'exceptions' stamp: 'AAB 6/14/2020 18:11:10'!
signalCantMoveTokenBeforeSixTurns

	self error: self class cantMoveTokenBeforeSixTurnsErrorDescription! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AAB 6/14/2020 18:11:33'!
signalCantPlaceTokenAfterSixTurns

	self error: self class noMoreTokensAllowedErrorDescription ! !


!TerniLapilli methodsFor: 'win condition' stamp: 'AAB 6/14/2020 17:01:25'!
forPlayer: aPlayer winInColumn: aColumn
	^ (((board at: (1@aColumn)) = aPlayer) and: ((board at: (2@aColumn)) = aPlayer) and: ((board at: (3@aColumn)) = aPlayer)).! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AAB 6/14/2020 17:04:16'!
forPlayer: aPlayer winInRow: aRow
	^ (((board at: (aRow@1)) = aPlayer) and: ((board at: (aRow@2)) = aPlayer) and: ((board at: (aRow@3)) = aPlayer)).! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AAB 6/14/2020 17:20:56'!
isWinner: aPlayer

	((self isWinnerInRow: aPlayer) or: (self isWinnerInColumn: aPlayer) or: (self isWinnerInDiagonal: aPlayer)) 
	ifTrue: [^actualPlayer]
	ifFalse: [^false]! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AAB 6/14/2020 17:08:40'!
isWinnerInColumn: aPlayer
	| winInFirstColumn winInSecondColumn winInThirdColumn|
	
	winInFirstColumn:= self forPlayer: aPlayer winInColumn: 1.
	winInSecondColumn:= self forPlayer: aPlayer winInColumn: 2.
	winInThirdColumn:= self forPlayer: aPlayer winInColumn: 3.
	
	^ winInFirstColumn or: winInSecondColumn or: winInThirdColumn.
! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AAB 6/14/2020 17:07:56'!
isWinnerInDiagonal: aPlayer
	| winInDiagonal winInInverseDiagonal |

	winInDiagonal := (((board at: (1@1)) = aPlayer) and: ((board at: (2@2)) = aPlayer) and: ((board at: (3@3)) = aPlayer)).
	winInInverseDiagonal := (((board at: (1@3)) = aPlayer) and: ((board at: (2@2)) = aPlayer) and: ((board at: (3@1)) = aPlayer)).
	
	^winInDiagonal or: winInInverseDiagonal.
! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AAB 6/14/2020 17:03:40'!
isWinnerInRow: aPlayer
	| winInFirstRow winInSecondRow winInThirdRow |
	
	winInFirstRow:= self forPlayer: aPlayer winInRow: 1.
	winInSecondRow:= self forPlayer: aPlayer winInRow: 2.
	winInThirdRow:= self forPlayer: aPlayer winInRow: 3.
	
	^ winInFirstRow or: winInSecondRow or: winInThirdRow.
! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AAB 6/14/2020 17:19:43'!
initialize

	actualPlayer := #X.
	board := Array2D height: 3 width: 3.
	board replaceValues: [:elem :x :y | false].
	turn := 0.
	winner := false.! !


!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/15/2020 20:49:32'!
aPosition: aPosition isNeighbourOf: aPosition2
	
	(2@2) fourNeighbors do: [:neighbourOfTheMiddleOfTheBoard | neighbourOfTheMiddleOfTheBoard = aPosition ifTrue: [^ self aPositionNotInCornersOrMiddleOfTheBoard: aPosition isNeighbourOf: aPosition2 ]].
	
	^ self aPositionInACornerOrTheMiddleOfTheBoard: aPosition isNeighbourOf: aPosition2
! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/15/2020 20:48:50'!
aPositionInACornerOrTheMiddleOfTheBoard: aPosition isNeighbourOf: aPosition2

	aPosition eightNeighbors do: [:neighbour | neighbour = aPosition2 ifTrue: [^true]].
	self error: self class invalidMovementErrorDescription.! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/15/2020 20:47:29'!
aPositionNotInCornersOrMiddleOfTheBoard: aPosition isNeighbourOf: aPosition2

	aPosition fourNeighbors do:[:neighbour | neighbour = aPosition2 ifTrue: [^true]].
	self error: self class invalidMovementErrorDescription.! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/14/2020 18:13:13'!
movingTokenFrom: aPosition isValidTo: aPosition2

	aPosition = aPosition2 ifTrue: [
			self error: self class invalidMovementErrorDescription 
	].
	self placingATokenAtIsValid: aPosition2.
	(self tokenPositionIsOutOfBoundaries: aPosition).

	(board at: aPosition) ~= actualPlayer ifTrue: [
		self error: self class cantMoveOtherPlayerTokenErrorDescription 
	].
	self state moveToken.! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/14/2020 17:23:27'!
placingATokenAtIsValid: aPosition

	(winner ~= false) ifTrue: [self error: self class gameFinishedErrorDescription].
	self tokenPositionIsOutOfBoundaries: aPosition.
	(board at: aPosition) ~= false ifTrue: [self error: self class tokenOverlapErrorDescription ]! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/14/2020 14:54:50'!
tokenPositionIsOutOfBoundaries: aTokenPosition
	
	(aTokenPosition between: (1@1) and: (3@3)) ifFalse: [ self error: self class tokenOutsideBoardErrorDescription ].
! !


!TerniLapilli methodsFor: 'testing' stamp: 'AAB 6/14/2020 13:13:24'!
tokenTypeAt: aPosition 
	
	^board at: aPosition.! !


!TerniLapilli methodsFor: 'player actions' stamp: 'AAB 6/14/2020 16:42:25'!
moveTokenAt: aPosition to: aPosition2 
	
	self movingTokenFrom: aPosition isValidTo: aPosition2.
	self aPosition: aPosition isNeighbourOf: aPosition2.
	board at: aPosition put: false.
	board at: aPosition2 put: actualPlayer.
	
	self advanceTurn.
	! !

!TerniLapilli methodsFor: 'player actions' stamp: 'AAB 6/14/2020 18:12:46'!
placeTokenAt: aPosition

	self state placeToken.
	
	self placingATokenAtIsValid: aPosition.
	board at: aPosition put: actualPlayer.

	self advanceTurn.! !


!TerniLapilli methodsFor: 'state' stamp: 'AAB 6/13/2020 15:17:43'!
actualPlayer

	^ actualPlayer! !

!TerniLapilli methodsFor: 'state' stamp: 'AAB 6/14/2020 18:12:11'!
state

	^ TerniLapilliState stateFor: self.! !

!TerniLapilli methodsFor: 'state' stamp: 'AAB 6/14/2020 17:54:28'!
turn

	^turn! !

!TerniLapilli methodsFor: 'state' stamp: 'AAB 6/14/2020 17:19:55'!
winner

	^winner.! !


!TerniLapilli methodsFor: 'game logic' stamp: 'AAB 6/14/2020 17:20:22'!
advanceTurn
	winner := self isWinner: actualPlayer.
	actualPlayer = #X ifTrue: [
		actualPlayer := #O
	] ifFalse:[
		actualPlayer := #X
	].
	turn := turn+1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 18:34:42'!
cantMoveOtherPlayerTokenErrorDescription
	
	^'Cant move other player token, it is cheating'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 18:26:39'!
cantMoveTokenBeforeSixTurnsErrorDescription
	
	^'cantMoveTokenBeforeSixTurnsErrorDescription'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 19:12:50'!
cantMoveTokenOutOfBoundariesErrorDescription
	self shouldBeImplemented.! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 18:16:33'!
gameFinishedErrorDescription
	
	^'Game is finished'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 18:55:27'!
invalidMovementErrorDescription
	
	^'That is not a valid movement'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 16:45:17'!
noMoreTokensAllowedErrorDescription
	^'No more tokens allowed'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 15:39:35'!
tokenOutsideBoardErrorDescription
	
	^ 'error token outside board'! !

!TerniLapilli class methodsFor: 'as yet unclassified' stamp: 'AAB 6/13/2020 16:16:55'!
tokenOverlapErrorDescription
	
	^ 'Position is already ocuppied.'! !


!classDefinition: #TerniLapilliState category: #TerniLapilli!
Object subclass: #TerniLapilliState
	instanceVariableNames: 'turn terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliState methodsFor: 'initialization' stamp: 'AAB 6/14/2020 17:58:50'!
initializeFor: aTerniLapilli
	terniLapilli := aTerniLapilli.
	turn := aTerniLapilli turn .! !


!TerniLapilliState methodsFor: 'token movement' stamp: 'AAB 6/14/2020 18:09:30'!
moveToken

	self subclassResponsibility ! !


!TerniLapilliState methodsFor: 'token placement' stamp: 'AAB 6/14/2020 18:09:39'!
placeToken

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliState class' category: #TerniLapilli!
TerniLapilliState class
	instanceVariableNames: ''!

!TerniLapilliState class methodsFor: 'state selection' stamp: 'AAB 6/14/2020 17:51:36'!
canHandle: aTerniLapilli
	
	self subclassResponsibility.! !

!TerniLapilliState class methodsFor: 'state selection' stamp: 'AAB 6/14/2020 17:50:52'!
stateFor: aTerniLapilli

	^(self subclasses detect: [:aTerniLapilliState | aTerniLapilliState canHandle: aTerniLapilli  ]) for: aTerniLapilli.! !


!TerniLapilliState class methodsFor: 'instance creation' stamp: 'AAB 6/14/2020 17:53:25'!
for: aTerniLapilli

	^self new initializeFor: aTerniLapilli! !


!classDefinition: #MoveTokensPhase category: #TerniLapilli!
TerniLapilliState subclass: #MoveTokensPhase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!MoveTokensPhase methodsFor: 'token movement' stamp: 'AAB 6/14/2020 18:09:15'!
moveToken

	^0! !


!MoveTokensPhase methodsFor: 'token placement' stamp: 'AAB 6/14/2020 18:11:23'!
placeToken

	^terniLapilli signalCantPlaceTokenAfterSixTurns! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveTokensPhase class' category: #TerniLapilli!
MoveTokensPhase class
	instanceVariableNames: ''!

!MoveTokensPhase class methodsFor: 'state selection' stamp: 'AAB 6/14/2020 17:57:17'!
canHandle: aTerniLapilli

	^ aTerniLapilli turn >= 6.! !


!classDefinition: #PlaceTokensPhase category: #TerniLapilli!
TerniLapilliState subclass: #PlaceTokensPhase
	instanceVariableNames: 'aTerniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlaceTokensPhase methodsFor: 'token movement' stamp: 'AAB 6/14/2020 18:08:21'!
moveToken

	^terniLapilli signalCantMoveTokenBeforeSixTurns! !


!PlaceTokensPhase methodsFor: 'token placement' stamp: 'AAB 6/14/2020 18:08:38'!
placeToken

	^0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlaceTokensPhase class' category: #TerniLapilli!
PlaceTokensPhase class
	instanceVariableNames: ''!

!PlaceTokensPhase class methodsFor: 'state selection' stamp: 'AAB 6/14/2020 17:57:23'!
canHandle: aTerniLapilli

	^ aTerniLapilli turn < 6.! !
