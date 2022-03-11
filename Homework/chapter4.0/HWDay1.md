## DAY1

### Q1
Explain what lives inside of an account.🙌
> - The stored content is divided into two parts, one part is **source code** , and the other part is stored **object information**. 

### Q2
What is the difference between the /storage/, /public/, and /private/ paths? 🥞
> - There are three kinds of information in account storage, one is **storage**, the other is **public** and the other is **private**. 
> - Among them, the actural information is stored in **storage**,  the **public** and **private** are the spaces that link points to, similar to the places where pointers are stored.


### Q3
What does .save() do? What does .load() do? What does .borrow() do?  🤓
> - **save** is used to store an object into the corresponding space.
> - **load** is used to load an object.
> - **borrow** plays a similar role to load , but it uses the reference type. The difference with load is that borrow does not need to destroy the resource ,but load dose.


### Q4
Explain why we couldn't save something to our account storage inside of a script. ✨
> - Script can only read the data on the blockchain and can't change any state.

### Q5 
Explain why I couldn't save something to your account.  🐱‍🏍
> - Because only authorized accounts can store things in my account, such as myself or my authorization for you.


### Q6
**Contract Code**
```swift
//Define a contract that returns a resource that has at least 1 field in it. Then, write 2 transactions:

//1.A transaction that first saves the resource to account storage, then loads it out of account storage, logs a field inside the resource, and destroys it.

//2. A transaction that first saves the resource to account storage, then borrows a reference to it, and logs a field inside the resource.
pub contract Day1{
    pub resource Item{
        pub let name:String

        init(_name:String){
            self.name = _name
        }
    }
    pub fun createItem(_name:String):@Item{
        return <- create Item(_name:_name)
    }
}
```

---

**Save Transaction**
```swift
import Day1 from 0x01
transaction(name:String){
    prepare(auth:AuthAccount){
        let item <- Day1.createItem(_name:name)
        auth.save(<- item, to: /storage/Item)
    }
}
```

---
**Load Transaction**
```swift
import Day1 from 0x01
transaction(){
    prepare(auth:AuthAccount){
        let item <- auth.load<@Day1.Item>(from:/storage/Item) ?? panic("Could not load item")
        log(item.name)
        destroy item
    }
    execute{
    }
}
```

---

**Borrow Transaction**
```swift
import Day1 from 0x01
transaction(){
    prepare(auth:AuthAccount){
        let item = auth.borrow<&Day1.Item>(from:/storage/Item) ?? panic("Could not load item")
        log(item.name)
    }
    execute{
    }
}
```