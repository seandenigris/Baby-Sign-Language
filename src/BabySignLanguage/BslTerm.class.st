Class {
	#name : #BslTerm,
	#superclass : #Object,
	#instVars : [
		'string'
	],
	#category : #BabySignLanguage
}

{ #category : #comparing }
BslTerm >> <= rhs [
	^ self string <= rhs string
]

{ #category : #actions }
BslTerm >> lookup [
	| baseURL url |
	baseURL := 'https://www.babysignlanguage.com/dictionary' asUrl.
	url := baseURL / self string first asString / self string.
	LibC system: 'open ', url asString
]

{ #category : #printing }
BslTerm >> printOn: aStream [
	aStream print: string
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
