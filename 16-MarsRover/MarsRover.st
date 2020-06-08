!classDefinition: #MarsRoverTest category: #MarsRover!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test01EmptyCommandDoesNothing

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: ''.
	self assert: rover position equals: 2@2.
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test02MoveForwardWest

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'f'.
	self assert: rover position equals: (1@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test03MoveForwardEast

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'E'.
	rover processCommand: 'f'.
	self assert: rover position equals: (3@2).
	self assert: rover facingTowards equals: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test04MoveForwardNorte

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'N'.
	rover processCommand: 'f'.
	self assert: rover position equals: (2@3).
	self assert: rover facingTowards equals: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test05MoveForwardSouth

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'S'.
	rover processCommand: 'f'.
	self assert: rover position equals: (2@1).
	self assert: rover facingTowards equals: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test06MoveTwoForward

	| rover |
	rover := MarsRover createAtCoordinates: 4@2 facing: 'O'.
	rover processCommand: 'ff'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test07MoveThreeForwards

	| rover |
	rover := MarsRover createAtCoordinates: 4@2 facing: 'O'.
	rover processCommand: 'fff'.
	self assert: rover position equals: (1@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test08MoveBackwardWest

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'b'.
	self assert: rover position equals: (3@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test09MoveBackwardEast

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'E'.
	rover processCommand: 'b'.
	self assert: rover position equals: (1@2).
	self assert: rover facingTowards equals: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test10MoveBackwardNorth

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'N'.
	rover processCommand: 'b'.
	self assert: rover position equals: (2@1).
	self assert: rover facingTowards equals: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test11MoveBackwardSouth

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'S'.
	rover processCommand: 'b'.
	self assert: rover position equals: (2@3).
	self assert: rover facingTowards equals: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:11'!
test12MoveTwoBackwards

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'bb'.
	self assert: rover position equals: (4@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test13MoveThreeBackwards

	| rover |
	rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'bbb'.
	self assert: rover position equals: (5@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test14RotateLeft

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'l'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test15RotateTwoLeft

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'll'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test16RotateThreeLeft

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'lll'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:11'!
test17RotateFourLeft

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'llll'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test18RotateLeftForward

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'lf'.
	self assert: rover position equals: (2@1).
	self assert: rover facingTowards equals: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test19RotateRight

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'r'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'N'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test20RotateTwoRight

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'rr'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'E'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test21RotateThreeRight

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'rrr'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'S'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test22ForwardBackwardKeepsSamePosition

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'fb'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test23LeftRightKeepsSameDirection

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'lr'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'O'.! !

!MarsRoverTest methodsFor: 'tests' stamp: 'AAB 6/7/2020 15:38:12'!
test24StopFollowingInstructionsAfterInvalidInstruction

	| rover |
	 rover := MarsRover createAtCoordinates: 2@2 facing: 'O'.
	rover processCommand: 'Al'.
	self assert: rover position equals: (2@2).
	self assert: rover facingTowards equals: 'O'.! !


!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'AAB 6/6/2020 17:38:28'!
initializeWithCoordinate: aPoint facing: aString 

	position := aPoint.
	cardinalDirection := aString.! !


!MarsRover methodsFor: 'state' stamp: 'AAB 6/6/2020 17:38:28'!
facingTowards
	
	^ cardinalDirection .! !

!MarsRover methodsFor: 'state' stamp: 'AAB 6/4/2020 21:32:58'!
position
	^position! !

!MarsRover methodsFor: 'state' stamp: 'AAB 6/7/2020 15:27:05'!
state

	^ MarsRoverState stateFor: self.! !


!MarsRover methodsFor: 'modify position' stamp: 'AAB 6/6/2020 16:55:01'!
decreaseX

	^ position := ((position x) - 1) @ (position y)! !

!MarsRover methodsFor: 'modify position' stamp: 'AAB 6/6/2020 16:54:47'!
decreaseY

	^ position := (position x) @ ((position y) - 1)! !

!MarsRover methodsFor: 'modify position' stamp: 'AAB 6/6/2020 16:54:35'!
increaseX

	^ position := ((position x) + 1) @ (position y)! !

!MarsRover methodsFor: 'modify position' stamp: 'AAB 6/6/2020 16:55:08'!
increaseY

	^ position := (position x) @ ((position y) + 1)! !


!MarsRover methodsFor: 'action' stamp: 'AAB 6/6/2020 17:34:27'!
isValidInstruction: anInstruction

	'fblr' do: [:validInstruction | validInstruction = anInstruction ifTrue: [^true]].
	^false. ! !

!MarsRover methodsFor: 'action' stamp: 'AAB 6/7/2020 15:38:11'!
processCommand: aCommand
	(ProcessMarsRoverCommand for: self with: aCommand) compute! !


!MarsRover methodsFor: 'directions' stamp: 'AAB 6/7/2020 15:17:06'!
east

	cardinalDirection := 'E'! !

!MarsRover methodsFor: 'directions' stamp: 'AAB 6/7/2020 15:17:14'!
north

	cardinalDirection := 'N'! !

!MarsRover methodsFor: 'directions' stamp: 'AAB 6/7/2020 15:17:20'!
south

	cardinalDirection := 'S'! !

!MarsRover methodsFor: 'directions' stamp: 'AAB 6/7/2020 15:30:23'!
west

	cardinalDirection := 'O'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'AAB 6/4/2020 21:06:01'!
createAtCoordinates: aPoint facing: aString 
	^ self new initializeWithCoordinate: aPoint facing: aString.! !


!classDefinition: #MarsRoverState category: #MarsRover!
Object subclass: #MarsRoverState
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverState methodsFor: 'initialization' stamp: 'AAB 6/7/2020 15:12:40'!
initializeFor: aMarsRover

	marsRover := aMarsRover! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: #MarsRover!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'instance creation' stamp: 'AAB 6/7/2020 15:11:44'!
for: aMarsRover

	^self new initializeFor: aMarsRover! !


!MarsRoverState class methodsFor: 'state selection' stamp: 'AAB 6/7/2020 15:27:42'!
canHandle: aCardinalDirection
	
	self subclassResponsibility.! !

!MarsRoverState class methodsFor: 'state selection' stamp: 'AAB 6/7/2020 15:28:03'!
stateFor: aMarsRover

	^(self subclasses detect: [:aMarsRoverState | aMarsRoverState canHandle: aMarsRover facingTowards ]) for: aMarsRover.! !


!classDefinition: #MarsRoverFacingEast category: #MarsRover!
MarsRoverState subclass: #MarsRoverFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverFacingEast methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:17:49'!
rotateLeft

	marsRover north ! !

!MarsRoverFacingEast methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:17:39'!
rotateRight

	marsRover south ! !


!MarsRoverFacingEast methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:18:17'!
backward

	marsRover decreaseX ! !

!MarsRoverFacingEast methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:18:07'!
forward

	marsRover increaseX ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingEast class' category: #MarsRover!
MarsRoverFacingEast class
	instanceVariableNames: ''!

!MarsRoverFacingEast class methodsFor: 'state selection' stamp: 'AAB 6/7/2020 15:15:17'!
canHandle: aCardinalDirection

	^aCardinalDirection = 'E'.! !


!classDefinition: #MarsRoverFacingNorth category: #MarsRover!
MarsRoverState subclass: #MarsRoverFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverFacingNorth methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:21:57'!
rotateLeft

	marsRover west ! !

!MarsRoverFacingNorth methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:22:11'!
rotateRight

	marsRover east ! !


!MarsRoverFacingNorth methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:21:45'!
backward

	marsRover decreaseY ! !

!MarsRoverFacingNorth methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:21:51'!
forward

	marsRover increaseY ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingNorth class' category: #MarsRover!
MarsRoverFacingNorth class
	instanceVariableNames: ''!

!MarsRoverFacingNorth class methodsFor: 'state selection' stamp: 'AAB 6/7/2020 15:21:38'!
canHandle: aCardinalDirection

	^aCardinalDirection = 'N'.! !


!classDefinition: #MarsRoverFacingSouth category: #MarsRover!
MarsRoverState subclass: #MarsRoverFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverFacingSouth methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:22:41'!
rotateLeft

	marsRover east ! !

!MarsRoverFacingSouth methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:22:50'!
rotateRight

	marsRover west ! !


!MarsRoverFacingSouth methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:22:31'!
backward

	marsRover increaseY ! !

!MarsRoverFacingSouth methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:22:36'!
forward

	marsRover decreaseY ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingSouth class' category: #MarsRover!
MarsRoverFacingSouth class
	instanceVariableNames: ''!

!MarsRoverFacingSouth class methodsFor: 'state selection' stamp: 'AAB 6/7/2020 15:22:25'!
canHandle: aCardinalDirection

	^aCardinalDirection = 'S'.! !


!classDefinition: #MarsRoverFacingWest category: #MarsRover!
MarsRoverState subclass: #MarsRoverFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverFacingWest methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:21:18'!
rotateLeft

	marsRover south ! !

!MarsRoverFacingWest methodsFor: 'change direction' stamp: 'AAB 6/7/2020 15:21:22'!
rotateRight

	marsRover north ! !


!MarsRoverFacingWest methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:21:09'!
backward

	marsRover increaseX ! !

!MarsRoverFacingWest methodsFor: 'change position' stamp: 'AAB 6/7/2020 15:21:13'!
forward

	marsRover decreaseX ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingWest class' category: #MarsRover!
MarsRoverFacingWest class
	instanceVariableNames: ''!

!MarsRoverFacingWest class methodsFor: 'state selection' stamp: 'AAB 6/7/2020 15:29:17'!
canHandle: aCardinalDirection

	^aCardinalDirection = 'O'.! !


!classDefinition: #ProcessMarsRoverCommand category: #MarsRover!
Object subclass: #ProcessMarsRoverCommand
	instanceVariableNames: 'aCommand marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!ProcessMarsRoverCommand methodsFor: 'initialization' stamp: 'AAB 6/7/2020 15:37:24'!
initializeFor: aMarsRover with: aCommandToProcess
	aCommand := aCommandToProcess.
	marsRover := aMarsRover.! !


!ProcessMarsRoverCommand methodsFor: 'evaluating' stamp: 'AAB 6/7/2020 15:37:24'!
compute 

	aCommand do: [
		:instruction |
		(marsRover isValidInstruction: instruction) ifFalse: [
			^marsRover	
		].
		(instruction = $f) ifTrue:[
			marsRover state forward.
		].
		(instruction = $b) ifTrue:[
			marsRover state backward.
		].
		(instruction = $l) ifTrue:[
			marsRover state rotateLeft.
		].
		(instruction = $r) ifTrue:[
			marsRover state rotateRight.
		].
	].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProcessMarsRoverCommand class' category: #MarsRover!
ProcessMarsRoverCommand class
	instanceVariableNames: ''!

!ProcessMarsRoverCommand class methodsFor: 'instance creation' stamp: 'AAB 6/7/2020 15:37:24'!
for: aMarsRover with: aCommandToProcess
	^self new initializeFor: aMarsRover with: aCommandToProcess! !
