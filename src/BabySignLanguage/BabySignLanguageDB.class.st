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
BabySignLanguageDB class >> repositories [

	^ { BslDictionary study. BslDictionary uniqueInstance }.
]

{ #category : #'loading/saving' }
BabySignLanguageDB class >> restoreRepositories: someRepositories [

	BslDictionary restoreFrom: someRepositories.
]
