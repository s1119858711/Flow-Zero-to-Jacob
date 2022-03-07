## DAY1

### Q1
1. In words, list 3 reasons why structs are different from resources.
    - Resrouce cannot be copied
    - Resrouce cannot be lost or overwritten
    - Resrouce connot be created whenever you want
    - They must be **extremely explicit** about how you handle a resource
    - Resrouce is much harder to deal with

---

### Q2
2. Describe a situation where a resource might be better to use than a struct.
    - Resource is useful when it is desired to model ownership. [a value exists exactly in one location and it should not be lost]
    - Certain constructs in a blockchain represent assets of real, tangible value, as much as a house or car or bank account. We have to worry about literal loss and theft, perhaps even on the scale of millions of dollars.
    - Struct are not an ideal way to represent this ownership because they are copied, this would mean that there could be a risk of having multiple copies of certain assets floating around, which breaks the scarcity requirements needed for these assets to have real value.
---

### Q3
3. What is the keyword to make a new resource?
    - **create**

---

### Q4
4. Can a resource be created in a script or transaction (assuming there isn't a public function to create one)?
    - Nope, Resource can be created outside of the contract 🤓

---

### Q5
5. What is the type of the resource below?
    - The type os **Jacob** [He is god🤩]

---

### Q6
6. Let's play the "I Spy" game from when we were kids. I Spy 4 things wrong with this code. Please fix them.
```swift
pub contract Test {

    // Hint: There's nothing wrong here ;)
    pub resource Jacob {
        pub let rocks: Bool
        init() {
            self.rocks = true
        }
    }

    pub fun createJacob(): @Jacob { // Change 1
        let myJacob <- create Jacob() // Change 2 and 3
        return <- myJacob // Change 4
    }
}
```

