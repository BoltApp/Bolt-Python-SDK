download-specs:
	@mkdir -p tmp
	@echo "Downloading API Specs..."
	@curl -s -o ./tmp/subscriptions.yml https://help.bolt.com/developers/apis/build-resources/subscriptions-api/spec.yml
	@curl -s -o ./tmp/bolt.yml https://assets.bolt.com/external-api-references/bolt.yml
	@curl -s -o ./tmp/ignite3.yml https://api-docs.bolt.com/api.bundle.yaml
	@echo "Downloaded API Spec files to 'tmp/' dir"

merge-specs:
	@echo "Merging API Specs..."
	@redocly join ./tmp/bolt.yml ./tmp/ignite3.yml ./tmp/subscriptions.yml -o ./tmp/merged.yml \
		--prefix-components-with-info-prop title \
		--prefix-tags-with-filename

generate-sdk:
	@speakeasy run

full: download-specs merge-specs generate-sdk
