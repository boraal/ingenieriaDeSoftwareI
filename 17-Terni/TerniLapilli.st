!classDefinition: #TerniLapilliTests category: #TerniLapilli!
TestCase subclass: #TerniLapilliTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:37:39'!
test23CantMoveTokensBeforeAllArePlacedInBoard
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt: (1@3).
	self should: [terniLapilli moveTokenFrom: (1@1) to: (1@2).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli cantMoveBeforeSixTurnsErrorDescription]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:38:00'!
test24CantMoveOtherPlayersTokens
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	self should: [terniLapilli moveTokenFrom: (2@3) to: (3@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli cantMoveOtherPlayerTokenErrorDescription]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:38:25'!
test25CantMoveTokenToSamePosition
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	self should: [terniLapilli moveTokenFrom: (2@2) to: (2@2).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli invalidMovementErrorDescription].
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:38:40'!
test26CantMoveTokenOverAnotherToken
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	self should: [terniLapilli moveTokenFrom: (2@2) to: (2@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli tokensOverlapErrorDescription ].
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:39:24'!
test27CantMoveTokenOutsideTheBoard
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	self should: [terniLapilli moveTokenFrom: (2@2) to: (2@3333).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription ].
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:39:19'!
test28CantMoveTokenFromOutsideTheBoard
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	self should: [terniLapilli moveTokenFrom: (2@4) to: (3@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription ].
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:40:17'!
test29CantMoveTokenAfterThereIsAWinner
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (2@1).
	
	terniLapilli placeTokenAt: (1@1).
	
	terniLapilli placeTokenAt: (2@3).
	
	terniLapilli placeTokenAt: (2@2).
	
	terniLapilli placeTokenAt: (1@2).
	
	terniLapilli placeTokenAt: (3@3).

	self should: [terniLapilli moveTokenFrom: (2@3) to: (1@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli gameFinishErrorDescription]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:40:38'!
test30WhenXMovesTokenItIsOTurn
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	terniLapilli moveTokenFrom: (2@2) to: (3@1).
	self assert: #O equals: terniLapilli actualPlayer 
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:40:56'!
test31WhenOMovesTokenItIsXTurn
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	terniLapilli moveTokenFrom: (2@2) to: (3@1).
	terniLapilli moveTokenFrom: (1@3) to: (2@2).
	self assert: #X equals: terniLapilli actualPlayer 
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:41:45'!
test32AfterMovingTokenThereIsNoTokenInPreviousPosition
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	terniLapilli moveTokenFrom: (2@2) to: (3@1).
	self assert: (terniLapilli tokenTypeAt: (2@2)) equals: (false)
	
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:42:05'!
test33AfterMovingTokenItIsInTheNewPosition
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	terniLapilli moveTokenFrom: (2@2) to: (3@1).
	self assert: (terniLapilli tokenTypeAt: (3@1)) equals: (#X)
	
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:43:58'!
test34CantMoveTokensFrom11To31
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	
	
	self should: [terniLapilli moveTokenFrom: (1@1) to: (3@1).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:44:12'!
test35CantMoveTokensFrom11To33
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(1@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	
	
	self should: [terniLapilli moveTokenFrom: (1@1) to: (3@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:44:24'!
test36CantMoveTokensFrom11To13
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(3@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	
	
	self should: [terniLapilli moveTokenFrom: (1@1) to: (1@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:44:32'!
test37CantMoveTokensFrom11To32
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(3@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(2@3).
	
	
	self should: [terniLapilli moveTokenFrom: (1@1) to: (3@2).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
	

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test movement' stamp: 'AA 6/14/2020 18:44:41'!
test38CantMoveTokensFrom11To23
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).	
	terniLapilli placeTokenAt:(3@3).
	terniLapilli placeTokenAt: (1@2).	
	terniLapilli placeTokenAt:(2@1).
	terniLapilli placeTokenAt: (2@2).	
	terniLapilli placeTokenAt:(3@1).
	
	
	self should: [terniLapilli moveTokenFrom: (1@1) to: (2@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli invalidMovementErrorDescription ]
	

	
	
	

			! !


!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:33:48'!
test13PlayerXWinsOnRowOne
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@3).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:34:48'!
test14PlayerXWinsOnRowTwo
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (2@3).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:35:05'!
test15PlayerXWinsOnRowThree
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (3@3).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:34:44'!
test16PlayerXWinsOnColumnOne
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (3@1).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:35:32'!
test17PlayerXWinsOnColumnTwo
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (3@2).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:35:47'!
test18PlayerXWinsOnColumnThree
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (3@3).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:36:22'!
test19PlayerXWinsOnDiagonal
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (3@3).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:36:37'!
test20PlayerXWinsOnInverDiagonal
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (3@1).
	terniLapilli placeTokenAt: (2@3).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (1@3).
	self assert: terniLapilli winner equals: #X.

	
	
	

			! !

!TerniLapilliTests methodsFor: 'test win' stamp: 'AA 6/14/2020 18:36:52'!
test21PlayerOCanWin
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (2@1).
	
	terniLapilli placeTokenAt: (1@1).
	
	terniLapilli placeTokenAt: (2@3).
	
	terniLapilli placeTokenAt: (2@2).
	
	terniLapilli placeTokenAt: (1@2).
	
	terniLapilli placeTokenAt: (3@3).
	
	self assert: terniLapilli winner equals: #O.

	
	
	

			! !


!TerniLapilliTests methodsFor: 'test starting conditions' stamp: 'AA 6/14/2020 18:22:02'!
test01PlayerXStartsPlaying

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	self assert: terniLapilli actualPlayer equals: #X.! !

!TerniLapilliTests methodsFor: 'test starting conditions' stamp: 'AA 6/14/2020 18:32:55'!
test12ThereIsNoWinnerWhenStarting
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	self assert: terniLapilli winner equals: false.
	
	

			! !


!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:48:25'!
test02AfterXPlaceTokenIsOTurn

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@2).
	self assert: terniLapilli actualPlayer equals: #O.! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:48:36'!
test03AfterOPlaceTokenIsXTurn

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@1).
	self assert: terniLapilli actualPlayer equals: #X.! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:24:25'!
test04TokenCanOnlyBePlacedWithHigherThan0CordinateY

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (2@0).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:24:57'!
test05TokenCanOnlyBePlacedWithLowerThan4CordinateY

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (1@4).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:25:34'!
test06TokenCanOnlyBePlacedWithLowerThan4CordinateX

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (4@1).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:26:32'!
test07TokenCanOnlyBePlacedWithHigherThan0CordinateX

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	self should: [terniLapilli placeTokenAt: (0@1).]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokenOutsideBoardErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:27:27'!
test08CantPlaceTokenAboveAnotherToken

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).
	
	self should: [terniLapilli placeTokenAt: (1@1)]
		raise: Error 
		withExceptionDo: [:anError | self assert: anError messageText equals: TerniLapilli tokensOverlapErrorDescription]! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:31:17'!
test09aPlacedTokenByPlayerXIsFromX

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	terniLapilli placeTokenAt: (1@1).
	self assert: (terniLapilli tokenTypeAt: (1@1)) equals: #X.! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:31:36'!
test10aPlacedTokenByPlayerYIsFromY

	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	
	self assert: (terniLapilli tokenTypeAt: (1@2)) equals: #O .! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:32:27'!
test11OnlySixTokensCanBePlaceOnTheBoard
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (1@2).
	terniLapilli placeTokenAt: (1@3).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@3).
	
	self should: [terniLapilli placeTokenAt: (3@1)]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli noMoreTokensAllowedErrorDescription]
	
	

			! !

!TerniLapilliTests methodsFor: 'test token placement' stamp: 'AA 6/14/2020 18:37:09'!
test22CantPlaceTokenAfterThereIsAWinner
	| terniLapilli |
	terniLapilli := TerniLapilli new.
	terniLapilli placeTokenAt: (1@1).
	terniLapilli placeTokenAt: (2@2).
	terniLapilli placeTokenAt: (2@1).
	terniLapilli placeTokenAt: (3@2).
	terniLapilli placeTokenAt: (3@1).
	
	
	self should: [terniLapilli placeTokenAt: (3@3).]
		raise: Error 
		withExceptionDo: [:anError | self assert: 
			anError messageText equals: TerniLapilli gameFinishErrorDescription]
	

	
	
	

			! !


!classDefinition: #TerniLapilli category: #TerniLapilli!
Object subclass: #TerniLapilli
	instanceVariableNames: 'actualPlayer board turn winner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilli methodsFor: 'exceptions' stamp: 'AA 6/14/2020 18:08:39'!
errorCantMoveBeforeSixTurns
	self error: self class cantMoveBeforeSixTurnsErrorDescription 

! !

!TerniLapilli methodsFor: 'exceptions' stamp: 'AA 6/14/2020 18:09:42'!
errorPlaceAfter6Moves
		self error: self class noMoreTokensAllowedErrorDescription.

! !


!TerniLapilli methodsFor: 'game logic' stamp: 'AA 6/14/2020 18:18:19'!
advanceTurn
	winner := self isWinner: actualPlayer.
	actualPlayer = #X ifTrue: [
		actualPlayer := #O
	] ifFalse:[
		actualPlayer := #X
	].
	"increase turn counter"
	turn := turn +1! !


!TerniLapilli methodsFor: 'initialization' stamp: 'AA 6/14/2020 17:15:31'!
initialize

	actualPlayer := #X.
	board := Array2D height: 3 width: 3.
	board replaceValues: [:elem :x :y | false].
	turn := 0.
	winner := false

	
	! !


!TerniLapilli methodsFor: 'player actions' stamp: 'AA 6/14/2020 16:41:37'!
moveTokenFrom: aPosition to: aPosition2 
	self movingAtokenFrom: aPosition isValidTo: aPosition2.
	self aPosition: aPosition isNeighbourOf: aPosition2. 
	board at: aPosition put: false. 
	board at: aPosition2 put: actualPlayer.
	
	self advanceTurn.! !

!TerniLapilli methodsFor: 'player actions' stamp: 'AA 6/14/2020 18:14:15'!
placeTokenAt: aPosition
	self status placeToken.
	self placingAtokenAtIsValid: aPosition.
	board at: aPosition put: actualPlayer.
	
	self advanceTurn.
	
	! !


!TerniLapilli methodsFor: 'state' stamp: 'AAB 6/13/2020 15:17:43'!
actualPlayer

	^ actualPlayer! !

!TerniLapilli methodsFor: 'state' stamp: 'AA 6/14/2020 18:14:45'!
status
	^TerniLapilliStatus stateFor: self.

! !

!TerniLapilli methodsFor: 'state' stamp: 'AA 6/14/2020 17:54:19'!
turn
	^turn! !

!TerniLapilli methodsFor: 'state' stamp: 'AA 6/14/2020 17:13:21'!
winner
	^winner

! !


!TerniLapilli methodsFor: 'testing' stamp: 'AA 6/13/2020 17:02:35'!
tokenTypeAt: aPosition 
	^board at: aPosition .! !


!TerniLapilli methodsFor: 'validation of play' stamp: 'AA 6/14/2020 16:41:37'!
aPosition: aPosition isNeighbourOf: aPosition2
	aPosition eightNeighbors do: [:neighbour |aPosition2 = neighbour ifTrue:[^true]].
	self error: self class invalidMovementErrorDescription.

! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AA 6/14/2020 18:14:07'!
movingAtokenFrom: aPosition isValidTo: aPosition2
	(aPosition = aPosition2) ifTrue: [self error: self class invalidMovementErrorDescription].
	self placingAtokenAtIsValid: aPosition2.
	self tokenPositionIsOutOfBoundaries: aPosition.
	
	((board at: aPosition) ~= actualPlayer) ifTrue: [self error: self class cantMoveOtherPlayerTokenErrorDescription ].
	self status moveToken.! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AA 6/14/2020 17:23:02'!
placingAtokenAtIsValid: aPosition
	((winner ~= false)) ifTrue: [self error:  self class gameFinishErrorDescription ].
	self tokenPositionIsOutOfBoundaries: aPosition.
	((board at: aPosition) ~= false) ifTrue: [self error: self class tokensOverlapErrorDescription ].
	! !

!TerniLapilli methodsFor: 'validation of play' stamp: 'AAB 6/13/2020 15:56:46'!
tokenPositionIsOutOfBoundaries: aTokenPosition
	
	(aTokenPosition between: (1@1) and: (3@3)) ifFalse: [^ self error: self class tokenOutsideBoardErrorDescription ].
! !


!TerniLapilli methodsFor: 'win condition' stamp: 'AA 6/14/2020 16:59:53'!
forPlayer: aPlayer winInColumn: aColumn
	^((board at: (1@aColumn))= aPlayer) and: ((board at: (2@aColumn))= aPlayer) and: ((board at: (3@aColumn)) = aPlayer).! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AA 6/14/2020 17:05:06'!
forPlayer: aPlayer winInRow: aRow
	^((board at: (aRow@1)) = aPlayer) and: ((board at: (aRow@2)) = aPlayer) and: ((board at: (aRow@3)) = aPlayer)
	
	! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AA 6/14/2020 17:19:14'!
isWinner: aPlayer
	((self isWinnerInDiagonals: aPlayer) or: (self isWinnerInColumns:aPlayer) or: (self isWinnerInRows: aPlayer)) 
	ifTrue:[^aPlayer]
	ifFalse:[^false].! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AA 6/14/2020 17:00:21'!
isWinnerInColumns: aPlayer
	|winInColumn1 winInColumn2 winInColumn3|
	winInColumn1 := self forPlayer: aPlayer winInColumn: 1.
	winInColumn2 := self forPlayer: aPlayer winInColumn: 2.
	winInColumn3 := self forPlayer: aPlayer winInColumn: 3.
	^winInColumn1 or: winInColumn2 or: winInColumn3.
	
	
	! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AA 6/14/2020 17:07:24'!
isWinnerInDiagonals: aPlayer
	|winInDiagonal1 winInDiagonal2|
	winInDiagonal1 := ((board at: (1@1)) = aPlayer) and: ((board at: (2@2)) = aPlayer) and: ((board at: (3@3)) = aPlayer).
	winInDiagonal2  := ((board at: (1@3)) = aPlayer) and: ((board at: (2@2)) = aPlayer) and: ((board at: (3@1)) = aPlayer).
	^winInDiagonal1 or: winInDiagonal2 .

	
	
	! !

!TerniLapilli methodsFor: 'win condition' stamp: 'AA 6/14/2020 17:03:49'!
isWinnerInRows: aPlayer
	|winInRow1 winInRow2 winInRow3|	
	winInRow1 := self forPlayer: aPlayer winInRow: 1.
	winInRow2 := self forPlayer: aPlayer winInRow: 2.
	winInRow3 := self forPlayer: aPlayer winInRow: 3.
	^winInRow1 or: winInRow2 or: winInRow3.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #TerniLapilli!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error' stamp: 'AA 6/13/2020 18:28:26'!
cantMoveBeforeSixTurnsErrorDescription
	^'cant move before six turns'! !

!TerniLapilli class methodsFor: 'error' stamp: 'AA 6/13/2020 18:44:12'!
cantMoveOtherPlayerTokenErrorDescription
	^'cant move other player token it is cheating'  ! !

!TerniLapilli class methodsFor: 'error' stamp: 'AA 6/13/2020 18:15:57'!
gameFinishErrorDescription
	^'game has already ended. Stop playing'! !

!TerniLapilli class methodsFor: 'error' stamp: 'AA 6/13/2020 18:58:17'!
invalidMovementErrorDescription
	^'invalid movement'! !

!TerniLapilli class methodsFor: 'error' stamp: 'AA 6/13/2020 16:50:05'!
noMoreTokensAllowedErrorDescription
	^'no more tokens allowed in game, there are already 6.'! !

!TerniLapilli class methodsFor: 'error' stamp: 'AAB 6/13/2020 15:39:35'!
tokenOutsideBoardErrorDescription
	
	^ 'error token outside board'! !

!TerniLapilli class methodsFor: 'error' stamp: 'AA 6/13/2020 16:11:01'!
tokensOverlapErrorDescription
	
	^ 'token overlap'! !


!classDefinition: #TerniLapilliStatus category: #TerniLapilli!
Object subclass: #TerniLapilliStatus
	instanceVariableNames: 'turn terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!TerniLapilliStatus methodsFor: 'initialization' stamp: 'AA 6/14/2020 17:58:43'!
initializeFor: aTerniLapilli
	terniLapilli := aTerniLapilli ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilliStatus class' category: #TerniLapilli!
TerniLapilliStatus class
	instanceVariableNames: ''!

!TerniLapilliStatus class methodsFor: 'instance creation' stamp: 'AA 6/14/2020 17:53:16'!
for: aTernilapilli
	^self new initializeFor: aTernilapilli! !


!TerniLapilliStatus class methodsFor: 'state selection' stamp: 'AA 6/14/2020 17:53:44'!
canHandle: aTernilapilli
	self subclassResponsibility.! !

!TerniLapilliStatus class methodsFor: 'state selection' stamp: 'AA 6/14/2020 17:52:20'!
stateFor: aTernilapilli
	^(self subclasses detect: [:aMarsRoverState | aMarsRoverState canHandle: aTernilapilli  ]) for: aTernilapilli.! !


!classDefinition: #MoveTokensPhase category: #TerniLapilli!
TerniLapilliStatus subclass: #MoveTokensPhase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!MoveTokensPhase methodsFor: 'token movement' stamp: 'AA 6/14/2020 18:03:48'!
moveToken
	^0! !


!MoveTokensPhase methodsFor: 'token placement' stamp: 'AA 6/14/2020 18:10:17'!
placeToken
	^terniLapilli errorPlaceAfter6Moves ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveTokensPhase class' category: #TerniLapilli!
MoveTokensPhase class
	instanceVariableNames: ''!

!MoveTokensPhase class methodsFor: 'state selection' stamp: 'AA 6/14/2020 18:04:34'!
canHandle: aTernilapilli
	^aTernilapilli turn >= 6! !


!classDefinition: #PlaceTokensPhase category: #TerniLapilli!
TerniLapilliStatus subclass: #PlaceTokensPhase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TerniLapilli'!

!PlaceTokensPhase methodsFor: 'token movement' stamp: 'AA 6/14/2020 18:10:58'!
moveToken
	^terniLapilli errorCantMoveBeforeSixTurns.! !


!PlaceTokensPhase methodsFor: 'token placement' stamp: 'AA 6/14/2020 18:10:39'!
placeToken
	^0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PlaceTokensPhase class' category: #TerniLapilli!
PlaceTokensPhase class
	instanceVariableNames: ''!

!PlaceTokensPhase class methodsFor: 'state selection' stamp: 'AA 6/14/2020 18:04:31'!
canHandle: aTernilapilli
	^aTernilapilli turn < 6! !
