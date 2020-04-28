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

!I class methodsFor: 'base' stamp: 'AAB 4/28/2020 13:17:59'!
next
	
	^self createChildNamed: self name , 'I'.! !


!I class methodsFor: 'operation' stamp: 'AAB 4/28/2020 13:12:07'!
* aNumber
	
	^aNumber ! !

!I class methodsFor: 'operation' stamp: 'AAB 4/28/2020 13:19:03'!
+ aNumber
	
	^aNumber next! !

!I class methodsFor: 'operation' stamp: 'AAB 4/28/2020 14:04:33'!
- aNumber

	[Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados ] value! !

!I class methodsFor: 'operation' stamp: 'AAB 4/28/2020 15:24:08'!
/ aNumber

	| cocienteActual |.
	self = aNumber
		ifTrue: [^I].
		
	cocienteActual := I.
	self > aNumber
	ifTrue: [^self-aNumber divisor: aNumber cocienteActual:cocienteActual]
	ifFalse:[ Error signal: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]! !

!I class methodsFor: 'operation' stamp: 'AAB 4/28/2020 15:53:24'!
> aNumber

	^ (aNumber isDescendantOf: self) not! !


!I class methodsFor: 'operaciones auxiliares' stamp: 'AAB 4/28/2020 15:23:26'!
divisor: aNumber cocienteActual: cocienteActual

	self = aNumber
	ifTrue: [^cocienteActual next].
	
	self >  aNumber
	ifTrue: [^self-aNumber divisor: aNumber cocienteActual: cocienteActual next]
	ifFalse: [cocienteActual]! !


!I class methodsFor: 'errores' stamp: 'AAB 4/28/2020 14:07:24'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'errores' stamp: 'AAB 4/28/2020 14:06:45'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	
	^ 'No estan soportados los numeros negativos'! !


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

!II class methodsFor: 'base' stamp: 'AAB 4/27/2020 21:42:32'!
previous
	
	^self parent! !


!II class methodsFor: 'operation' stamp: 'AAB 4/28/2020 13:16:46'!
* aNumber

	^self previous * aNumber + aNumber ! !

!II class methodsFor: 'operation' stamp: 'AAB 4/28/2020 13:19:19'!
+ aNumber

	^self previous + aNumber next ! !

!II class methodsFor: 'operation' stamp: 'AAB 4/28/2020 16:01:00'!
- aNumber
	
	aNumber  = I 
		ifTrue: [ ^self previous ]
		ifFalse: [^self previous - aNumber previous ]! !



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


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIII category: #'Numeros de Peano'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!
