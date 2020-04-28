!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'base' stamp: 'AA 4/28/2020 13:20:23'!
next

	^self createChildNamed: self name , 'I'.! !

!I class methodsFor: 'base' stamp: 'AA 4/28/2020 16:07:45'!
previous
	[Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados ] value! !


!I class methodsFor: 'auxiliar for operation' stamp: 'AA 4/28/2020 15:23:20'!
divisor: aNumber cocienteActual: cocienteActual 
	
	self = aNumber
	ifTrue: [^cocienteActual next].
	self > aNumber
	ifTrue: [^self-aNumber divisor: aNumber cocienteActual: cocienteActual next]
	ifFalse:[cocienteActual]! !

!I class methodsFor: 'auxiliar for operation' stamp: 'AA 4/28/2020 16:09:50'!
restaAuxiliar: aNumber 
	^(aNumber previous)! !


!I class methodsFor: 'operation' stamp: 'AA 4/28/2020 13:11:52'!
* aNumber 
	
	^aNumber! !

!I class methodsFor: 'operation' stamp: 'AA 4/28/2020 13:20:45'!
+ aNumber 
	
	^aNumber next! !

!I class methodsFor: 'operation' stamp: 'AA 4/28/2020 14:02:37'!
- aNumber 
	[Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados ] value! !

!I class methodsFor: 'operation' stamp: 'AA 4/28/2020 15:24:04'!
/ aNumber 
	|cocienteActual|
	self = aNumber
	ifTrue: [^I].
	
	cocienteActual := I.
	self > aNumber
	ifTrue: [^self-aNumber divisor: aNumber cocienteActual: cocienteActual]
	ifFalse:[Error signal: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]! !

!I class methodsFor: 'operation' stamp: 'AA 4/28/2020 15:53:07'!
> aNumber
	^(aNumber isDescendantOf: self) not ! !


!I class methodsFor: 'errores' stamp: 'AA 4/28/2020 14:07:26'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor 
	^'No se puede dividir por un numbero mayor'
	! !

!I class methodsFor: 'errores' stamp: 'AA 4/28/2020 14:06:47'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No estan soportados los numeros negativos'
	! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'base' stamp: 'AM 4/27/2020 21:42:53'!
previous

	^self parent! !


!II class methodsFor: 'auxiliar for operation' stamp: 'AA 4/28/2020 16:10:55'!
restaAuxiliar: aNumber 
	^self previous restaAuxiliar: (aNumber previous)! !


!II class methodsFor: 'operation' stamp: 'AA 4/28/2020 13:15:17'!
* aNumber 

	^self previous * aNumber  + aNumber! !

!II class methodsFor: 'operation' stamp: 'AA 4/28/2020 13:20:40'!
+ aNumber 

	^self previous + aNumber next! !

!II class methodsFor: 'operation' stamp: 'AA 4/28/2020 16:13:08'!
- aNumber 
	^aNumber restaAuxiliar: self! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!
