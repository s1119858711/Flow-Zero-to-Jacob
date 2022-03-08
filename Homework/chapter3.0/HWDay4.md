## DAY4

### Q1
Explain, in your own words, the 2 things resource interfaces can be used for (we went over both in today's content)

1. Interface is used as a substitute when we use **struct** or **resource**, instead of using themselves. 🐱‍👤
2. Interface can protect some viriables or functions in **struct** or **resource**, thus exposing only the part we need, greatly enhancing the security. 🙌

---

### Q2
Define your own contract. Make your own resource interface and a resource that implements the interface. Create 2 functions. In the 1st function, show an example of not restricting the type of the resource and accessing its content. In the 2nd function, show an example of restricting the type of the resource and NOT being able to access its content.
```swift
pub contract Day4 {
    pub resource interface IBook {
      pub var name: String
      pub var number: Int
    }

    pub resource Book: IBook {
      pub var name: String
      pub var number: Int

      pub fun updateNumber(newNumber: Int): Int {
        self.number = newNumber
        return self.number // returns the new number
      }

      init() {
        self.name = "Spongebob"
        self.number = 1
      }
    }
    //Function 1, it not restricting the type of the resource and accessing its content
    pub fun noInterface() {
      let test: @Book{IBook} <- create Book()
      log(test.number) // 5

      destroy test
    }

    //Function 2, it can not being able to access its content, beacuse it is not implement in the Interface IBook
    pub fun yesInterface() {
      let test: @Book{IBook} <- create Book()
      let newNumber = test.updateNumber(newNumber: 5)
      log(newNumber) // 5

      destroy test
    }
}
```

---

### Q3

Fixed Code
```swift
pub contract Stuff {
    pub struct interface ITest {
      pub var greeting: String
      pub var favouriteFruit: String
      pub fun changeGreeting(newGreeting: String): String //Change3
    }


    pub struct Test: ITest {
      pub var greeting: String
      pub var favouriteFruit: String  //Change 1
      pub fun changeGreeting(newGreeting: String): String {
        self.greeting = newGreeting
        return self.greeting // returns the new greeting
      }

      init() {
        self.greeting = "Hello!"
        self.favouriteFruit = "Jacob"  //Change 2
      }
    }

    pub fun fixThis() {
      let test: Test{ITest} = Test()
      let newGreeting = test.changeGreeting(newGreeting: "Bonjour!") 
      log(newGreeting)
    }
}
```