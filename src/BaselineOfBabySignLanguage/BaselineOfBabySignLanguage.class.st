Class {
	#name : #BaselineOfBabySignLanguage,
	#superclass : #BaselineOf,
	#category : #BaselineOfBabySignLanguage
}

{ #category : #baselines }
BaselineOfBabySignLanguage >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'Soup' with: [ 
				spec repository: 'github://seandenigris/Soup-for-Pharo/repository' ];
			baseline: 'ExternalWebBrowser' with: [
				spec repository: 'github://seandenigris/Pharo-Web-Browser' ];
			baseline: 'ComputerWorld' with: [
				spec repository: 'github://seandenigris/Computer-World' ];
			package: #'BabySignLanguage'  with: [
				spec requires: #(#'Soup' #'ExternalWebBrowser' #'ComputerWorld') ] ]
]
