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
BslDictionary class >> browseOnline [
	<script>
	CwSafari new openInNewWindow: 'https://www.babysignlanguage.com/dictionary' asUrl
]

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

{ #category : #UI }
BslDictionary class >> uiMenuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'BSL Browser')
		"parent: #'My Parent';"
		order: 1; "Be first"
		action: [ self study browse ]; 
		icon: Smalltalk ui icons smallLoadProjectIcon
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
BslDictionary >> browse [

	| browser |
	browser := GLMTabulator new.
	browser row: #Words.
	browser transmit
		to: #Words;
		andShow: [ :a | 
			a fastList
				title: 'Words';
				selectionAct: [ :list | list selection lookUp ] on: $l entitled: 'Look up';
				selectionAct: [ :list | list selection inspect ] on: $i entitled: 'Inspect';
				onChangeOfPort: #strongSelection act: [ :list | list selection lookUp ];
				"filterOn: [:text :each | each string includesSubstring: text ]"
					enableFilter;
				helpMessage: 'Enter a filtering request' ].
	^ browser openOn: self terms
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
