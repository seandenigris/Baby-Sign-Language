Class {
	#name : #BabySignLanguageDB,
	#superclass : #SpFileDatabase,
	#category : #'BabySignLanguage-Persistence'
}

{ #category : #accessing }
BabySignLanguageDB class >> backupDirectoryParent [
	
	^ FileLocator dynabookData
]

{ #category : #'loading/saving' }
BabySignLanguageDB class >> schema [
	^ { 
		BslDictionary }
]
