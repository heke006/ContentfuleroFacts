.PHONY: all setup

all:
	xcodebuild -workspace 'ContentfuleroFacts.xcworkspace' -scheme 'ContentfuleroFacts'|xcpretty

setup:
	bundle install
	bundle exec pod install
