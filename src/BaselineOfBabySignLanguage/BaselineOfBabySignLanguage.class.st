Class {
	#name : #BaselineOfBabySignLanguage,
	#superclass : #BaselineOf,
	#category : #BaselineOfBabySignLanguage
}

{ #category : #testing }
BaselineOfBabySignLanguage class >> isDynabook [
	^ true
]

{ #category : #baselines }
BaselineOfBabySignLanguage >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'ComputerWorld' with: [
				spec repository: 'github://seandenigris/Computer-World' ];
			baseline: 'ExternalWebBrowser' with: [
				spec repository: 'github://seandenigris/Pharo-Web-Browser' ];
			baseline: 'FlashcardsSt' with: [
				spec repository: 'github://seandenigris/Flashcards' ];
			baseline: 'LivingLibrary' with: [
				spec repository: 'github://seandenigris/Living-Library' ];
			baseline: 'SimplePersistence' with: [
				spec repository: 'github://seandenigris/Simple-Persistence' ];
			baseline: 'Soup' with: [ 
				spec repository: 'github://seandenigris/Soup-for-Pharo' ];
			package: #'BabySignLanguage'  with: [
				spec requires: #(#'ComputerWorld' #'ExternalWebBrowser' #'FlashcardsSt' #'SimplePersistence' #'Soup' ) ] ]
]
