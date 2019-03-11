Class {
	#name : #CwVimeoUrl,
	#superclass : #ZnUrl,
	#category : #BabySignLanguage
}

{ #category : #'as yet unclassified' }
CwVimeoUrl >> autoplay: aBoolean [
	"https://vimeo.zendesk.com/hc/en-us/articles/115004485728-Autoplaying-and-looping-embedded-videos"

	aBoolean
		ifTrue: [ self queryAt: 'autoplay' put: 1 ]
		ifFalse: [ self queryRemoveKey: 'autoplay' ].
	
	
]

{ #category : #'as yet unclassified' }
CwVimeoUrl >> videoID [
	^ self pathSegments second asNumber
]
