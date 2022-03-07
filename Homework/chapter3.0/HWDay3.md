## DAY3

### Q1
Contract Code
```swift
// Define your own contract that stores a dictionary of resources. Add a function to get a reference to one of the resources in the dictionary.

pub contract Day3 {

    pub var dictionaryOfGreetings: @{String: Book}

    pub resource Book {
        pub let language: String
        init(_language: String) {
            self.language = _language
        }
    }

    pub fun getReference(key: String): &Book {
        return &self.dictionaryOfGreetings[key] as &Book
    }

    init() {
        self.dictionaryOfGreetings <- {
            "A": <- create Book(_language: "FirstBook"), 
            "B": <- create Book(_language: "SecondBook")
        }
    }
}
```
---

### Q2
Script Code
```swift
//Create a script that reads information from that resource using the reference from the function you defined in part 1.
import Day3 from 0x01

pub fun main(): String {
  let ref = Day3.getReference(key: "A")
  return ref.language // returns "FirstBook"
}
```

---

### Q3

Explain, in your own words, why references can be useful in Cadence.
1. They don't need to be explicitly processed, which is much more convenient than mobile resources. 🍨

2. They are copied, it is so cool in specific circumastances. 🎂
