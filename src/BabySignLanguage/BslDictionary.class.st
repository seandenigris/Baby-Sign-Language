Class {
	#name : #BslDictionary,
	#superclass : #Object,
	#instVars : [
		'terms'
	],
	#classInstVars : [
		'uniqueInstance',
		'study'
	],
	#category : #BabySignLanguage
}

{ #category : #accessing }
BslDictionary class >> fill [
	| baseUrl soup container links terms |
	baseUrl := 'https://www.babysignlanguage.com/dictionary' asUrl.
($b to: $z) do: [ :e |
	soup := Soup fromUrl: baseUrl / e asString.
	container := soup findTag: [ :t | t @ 'itemprop' = 'articleBody' ].
	links := container findAllTags: #a.
	terms := links collect: #string.
	terms do: [ :t | self uniqueInstance terms add: t ] ].
]

{ #category : #accessing }
BslDictionary class >> study [
	^ study ifNil: [ study := self new ]
]

{ #category : #accessing }
BslDictionary class >> study: anObject [
	study := anObject
]

{ #category : #accessing }
BslDictionary class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #accessing }
BslDictionary class >> uniqueInstance: anObject [
	uniqueInstance := anObject
]

{ #category : #accessing }
BslDictionary >> lookUp: aString [
	BslTerm new string: aString; lookup
]

{ #category : #accessing }
BslDictionary >> terms [
	^ terms ifNil: [ terms := SortedCollection new ]
]

{ #category : #accessing }
BslDictionary >> terms: anObject [
	terms := anObject
]
