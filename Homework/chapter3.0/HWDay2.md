## DAY2

### Contract Code

```swift
// Write your own smart contract that contains two state variables: an array of resources, and a dictionary of resources. 
// Add functions to remove and add to each of them. They must be different from the examples above.

pub contract Day2{
    pub resource Book{
        //Book Had ID and Title, two attribute
        pub let title:String
        pub let id:UInt64

        init(_ title:String){
            self.id = self.uuid
            self.title = title
        }
    }

    //create Book resource
    pub fun createBook(_ title:String): @Book {
        var newBook <- create Book(title)
        return <- newBook
    }


    //Define function about resource array
    pub let BooksArray : @[Book]
    pub fun addBookArray(_ book:@Book){
        self.BooksArray.append(<- book)
        log("Had add book to array")
    }
    pub fun removeBookArray(_ index:Int):@Book{
        log("Had removed book from array")
        return <- self.BooksArray.remove(at: index)
    }
    pub fun getBookArrayLen():Int{
        return self.BooksArray.length
    }

    //Define function about resource dictionaried
    pub let BookDictionary : @{UInt64:Book}
    pub fun addBookDictionary(_ book:@Book){
        let bookId = book.id
        let oldBook <- self.BookDictionary[bookId] <- book
        log("Had add Book to Dictionary")
        destroy oldBook
    }
    pub fun removeBookDictionary(_ id:UInt64) :@Book {
        let removedBook <- self.BookDictionary.remove(key: id) ?? panic ("Could not find this book id")
        log("Had move one book from dictionary")
        return <- removedBook
    }
    pub fun getBookDictionaryKeys():[UInt64]{
        return self.BookDictionary.keys
    }
    
    init(){
        self.BooksArray <- []
        self.BookDictionary <- {}
    }
}
```
---

### Transaction Code
```swift
import Day2 from 0x02
transaction{
    prepare(acct:AuthAccount){}
    execute{
        //Check Array
        let book1 <- Day2.createBook("FirstBook")
        let book2 <- Day2.createBook("SecondBook")
        Day2.addBookArray(<- book1)
        Day2.addBookArray(<- book2)
        let oldBookArray <- Day2.removeBookArray(0)
        destroy oldBookArray
        //Check Dictionary
        let book3 <- Day2.createBook("ThirdBook")
        let book4 <- Day2.createBook("ForthBook")
        Day2.addBookDictionary(<- book3)
        Day2.addBookDictionary(<- book4)
    }
}

```

---

### Script Code
```swift
import Day2 from 0x01

pub fun main(){
    log(Day2.getBookArrayLen())
    log(Day2.getBookDictionaryKeys())
}
```