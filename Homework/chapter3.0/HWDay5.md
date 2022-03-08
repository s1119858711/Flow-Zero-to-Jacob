## DAY5


### Contract Code
```swift
access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        //
        // 3 Functions
        //

        pub fun publicFunc() {}
        //It could be called in Contract,Transaction,Script

        access(contract) fun contractFunc() {}
        //It could be called in this contract


        access(self) fun privateFunc() {}
        //It only could be called in this struct--SomeStruct


        pub fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /**************/

            //Read Scope
            //a,b,c,d

            //Write Scope
            //a,b,c,d
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    pub resource SomeResource {
        pub var e: Int

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/
            //Read Scope
            //a,b,c

            //Write Scope
            //a
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/ 
        //Read Scope
        //a,b,c

        //Write Scope
        //a
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
```

### Script Code
```swift
import SomeContract from 0x01
pub fun main() {
    /**************/
    /*** AREA 4 ***/
    /**************/
    //Read Scope
    //a,b

    //Write Scope
    //Noe
}
```