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

{ #category : #'as yet unclassified' }
BslDictionary class >> exampleStudyTerms [
	<sampleInstance>
	
	^ BslDictionary study terms collect: [ :e | 
			FsSmItem new
				material: e;
				yourself ].
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

{ #category : #persistence }
BslDictionary class >> restoreFrom: aCollection [

	study := aCollection first.
	uniqueInstance := aCollection second.
]

{ #category : #persistence }
BslDictionary class >> spData [
	^ { BslDictionary study. BslDictionary uniqueInstance }.
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
BslDictionary >> addTermNamed: aString [
	| term |
	term := BslTerm new
		string: aString; 
		yourself.
	^ self terms add: term
	
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
BslDictionary >> gtSearchTermsFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 5;
		title: 'Terms';
		items: [ self terms ];
		matchSubstrings
]

{ #category : #accessing }
BslDictionary >> gtViewTermsOn: aView [
	<gtView>
	
	^ aView list
		title: 'Terms';
		priority: 50;
		items: [ self terms ]
]

{ #category : #accessing }
BslDictionary >> lookUp: aString [
	BslTerm new string: aString; lookup
]

{ #category : #accessing }
BslDictionary >> printOn: aStream [
	terms ifNotNil: [ aStream print: terms size ].
	aStream
		nextPutAll: ' BSL Terms'
]

{ #category : #accessing }
BslDictionary >> terms [
	^ terms ifNil: [ terms := SortedCollection sortBlock: #string ascending ]
]

{ #category : #accessing }
BslDictionary >> terms: anObject [
	terms := anObject
]
