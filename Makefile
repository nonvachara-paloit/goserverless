.PHONY: build clean deploy gomodgen

build: gomodgen
	export GO111MODULE=on
	env GOOS=linux go build -ldflags="-s -w" -o bin/hello hello/main.go
	env GOOS=linux go build -ldflags="-s -w" -o bin/world world/main.go

buildtest:
	env GOOS=linux go test -c -o bin/hello -covermode=count -test.coverprofile hello.cov ./hello
	env GOOS=linux go test -c -o bin/world -covermode=count -test.coverprofile world.cov ./world

clean:
	rm -rf ./bin ./vendor go.sum

deploy: clean build
	sls deploy --verbose

gomodgen:
	chmod u+x gomod.sh
	./gomod.sh
