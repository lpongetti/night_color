can_publish:
	flutter upgrade && flutter pub upgrade && flutter format --fix ./ && flutter analyze ./ && flutter test

publish:
	flutter upgrade && flutter pub upgrade && flutter format --fix ./ && flutter analyze ./ && flutter test && flutter pub pub publish