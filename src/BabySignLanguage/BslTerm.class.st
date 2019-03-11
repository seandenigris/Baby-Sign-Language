Class {
	#name : #BslTerm,
	#superclass : #Object,
	#instVars : [
		'string',
		'videoUrl',
		'alias'
	],
	#category : #BabySignLanguage
}

{ #category : #comparing }
BslTerm >> <= rhs [
	^ self string <= rhs string
]

{ #category : #accessing }
BslTerm >> alias [
	^ alias
]

{ #category : #accessing }
BslTerm >> alias: anObject [
	alias := anObject
]

{ #category : #private }
BslTerm >> dictionaryUrl [
	| baseURL |
	baseURL := 'https://www.babysignlanguage.com/dictionary' asUrl.
	^ baseURL / self dictionaryWord first asString / self dictionaryWord.
]

{ #category : #private }
BslTerm >> dictionaryWord [
	^ self alias ifNil: [ self string ]
]

{ #category : #actions }
BslTerm >> hasVideo [
	^ self videoUrl isNotNil
]

{ #category : #actions }
BslTerm >> lookUp [

	self hasVideo
		ifTrue: [ self showVideo ]
		ifFalse: [ self showDictionary ]
]

{ #category : #printing }
BslTerm >> printOn: aStream [
	aStream nextPutAll: string
]

{ #category : #actions }
BslTerm >> showDictionary [

	self showUrl: self dictionaryUrl
]

{ #category : #actions }
BslTerm >> showUrl: aUrl [

	CwSafari new
		applescriptTell: 'set bounds of window 1 to {0, 0, 600, 800}'; "from https://apple.stackexchange.com/a/171374/9507"
		openInFront: aUrl.
	
	"Implementation note: Ideally, we would play the video inside Pharo, but since we don't know how, so we workaround by manually setting up a Safari window where we ant it and sending URLs there."
]

{ #category : #actions }
BslTerm >> showVideo [

	self showUrl: self videoUrl
]

{ #category : #accessing }
BslTerm >> string [
	^ string
]

{ #category : #accessing }
BslTerm >> string: anObject [
	string := anObject
]

{ #category : #actions }
BslTerm >> study [
	BslDictionary study terms add: self
]

{ #category : #private }
BslTerm >> videoUrl [
	| page iframe |

	videoUrl ifNotNil: [ ^ videoUrl ].

	page := Soup fromUrl: self dictionaryUrl.
	iframe := page findTag: [ :e | e name = #iframe and: [ e src includesSubstring: 'vimeo' ] ].
	^ iframe ifNotNil: [ videoUrl := iframe src asVimeoUrl queryRemoveAll autoplay: true ]
]

{ #category : #accessing }
BslTerm >> videoUrl: anObject [
	videoUrl := anObject
]
