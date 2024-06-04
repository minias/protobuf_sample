# See README.md.
# go.mod module name is "protobuf/examples"
.PHONY: go gotest clean
go:     add_person_go     list_people_go
gotest: add_person_gotest list_people_gotest
clean:
	rm -rf tutorialpb bin
./tutorialpb/addressbook.pb.go: addressbook.proto
	mkdir -p ./tutorialpb # make directory for go package
	protoc $$PROTO_PATH --go_opt=paths=source_relative --go_out=./tutorialpb addressbook.proto
add_person_go: ./tutorialpb/addressbook.pb.go
	go build -o bin/add_person cmd/add_person/add_person.go 
add_person_gotest: ./tutorialpb/addressbook.pb.go
	go test protobuf/examples/cmd/add_person
list_people_go: ./tutorialpb/addressbook.pb.go
	go build -o bin/list_people cmd/list_people/list_people.go
list_people_gotest: ./tutorialpb/addressbook.pb.go
	go test protobuf/examples/cmd/list_people