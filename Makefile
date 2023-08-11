validate_version:
ifndef VERSION
	$(error VERSION is undefined)
endif

release: validate_version
	# linux
	GOOS=linux go build -o ip ;\
	tar -zcvf ./releases/ip_${VERSION}_linux.tar.gz ./ip ;\

	# macos
	GOOS=darwin go build -o ip ;\
	tar -zcvf ./releases/ip_${VERSION}_macOS.tar.gz ./ip ;\

	# windows
	GOOS=windows go build -o ip ;\
	tar -zcvf ./releases/ip_${VERSION}_windows.tar.gz ./ip ;\

	rm ./ip