Extension { #name : #String }

{ #category : #'*BabySignLanguage' }
String >> asVimeoUrl [
	^ CwVimeoUrl fromString: self
]
