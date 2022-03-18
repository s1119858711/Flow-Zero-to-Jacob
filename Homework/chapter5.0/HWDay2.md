## DAY2

### Q1
Explain why standards can be benefitial to the Flow ecosystem.🍕
- Because there must be a lot of products in an ecology, which can be NFT or FT.
- These products all need to meet some basic standards.
- And this is also beneficial to the whole ecology, such as the development of NFT Mall.

---

### Q2
What is YOUR favourite food ? ✔
- Jacob Tucker
---

### Q3
Please fix this code (Hint: There are two things wrong):

#### The contract interface:
```swift
//The contract interface:
pub contract interface ITest {
  pub var number: Int
  
  pub fun updateNumber(newNumber: Int) {
    pre {
      newNumber >= 0: "We don't like negative numbers for some reason. We're mean."
    }
    post {
      self.number == newNumber: "Didn't update the number to be the new number."
    }
  }
  pub resource interface IStuff {
    pub var favouriteActivity: String
  }
  //change 1 ✔
  pub resource Stuff:IStuff {
    pub var favouriteActivity: String
  }
}
```
---
#### The implementing contract:
```swift
//The implementing contract
//change 2 ✔
pub contract Test:ITest {
  pub var number: Int
  
  pub fun updateNumber(newNumber: Int) {
    self.number = 5
  }

  pub resource interface IStuff {
    pub var favouriteActivity: String
  }
  //change 3 ✔
  pub resource Stuff: ITest.IStuff {
    pub var favouriteActivity: String

    init() {
      self.favouriteActivity = "Playing League of Legends."
    }
  }

  init() {
    self.number = 0
  }
}
```
