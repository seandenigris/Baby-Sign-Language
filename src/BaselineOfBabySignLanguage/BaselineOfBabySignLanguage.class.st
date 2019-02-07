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
			package: #'BabySignLanguage'  with: [
				spec requires: #'Soup' ] ]
]
