# protobuf_sample

```sh
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```

Build the Go samples with "make go". This creates the following executable files in the current directory:

```sh
# When you make go, the addressbook.pb.go file is automatically compiled and generated in the tutorialpb folder.
make go 
ls -al bin
```

> To run the example:

```sh
cd bin
./add_person_go addressbook.data
./list_people_go addressbook.data
```

> To run the example test:

```sh
make gotest
```

## IA

```sh
tree -d
├── bin
├── cmd
│   ├── add_person
│   └── list_people
└── tutorialpb
```

## compile protoc

```sh
#protoc -I=$SRC_DIR --go_out=$DST_DIR $SRC_DIR/addressbook.proto
protoc -I=. --go_out=./tutorialpb ./addressbook.proto
```
