##DAY1

### Q1
Describe what an event is, and why it might be useful to a client.🐱‍👤
- Event can help us to know more clearly what changes have token place in the chain and which variable states have been updated.
---
### Q2
Deploy a contract with an event in it, and emit the event somewhere else in the contract indicating that it happened. 👣
```swift
access(all) contract HelloWorld {
    // Declare a public field of type String.
    //
    // All fields must be initialized in the init() function.
    access(all) var greeting: String
    //when greeting field changed, the event will emit.
    pub event ChangeGreeting(old:String,new:String)
    pub fun change(new:String){
        emit ChangeGreeting(old:self.greeting,new:self.greeting)
        self.greeting = new
    }

    // The init() function is required if the contract contains any fields.
    init() {
        self.greeting = "Hello, World!"
    }

    // Public function that returns our friendly greeting!
    access(all) fun hello(): String {
        return self.greeting
    }
}
```
---

### Q3
Using the contract in step 2), add some pre conditions and post conditions to your contract to get used to writing them out. 😘
```swift
access(all) contract HelloWorld {
    // Declare a public field of type String.
    //
    // All fields must be initialized in the init() function.
    access(all) var greeting: String
    //when greeting field changed, the event will emit.
    pub event ChangeGreeting(old:String,new:String)
    pub fun change(new:String):String {
        
        pre {
            self.greeting == "Hello, World!":"It is not HelloWorld"
        }
        post {
            result == new : "It change failed"
        }
        emit ChangeGreeting(old:self.greeting,new:self.greeting)
        self.greeting = new
        return self.greeting
    }

    // The init() function is required if the contract contains any fields.
    init() {
        self.greeting = "Hello, World!"
    }

    // Public function that returns our friendly greeting!
    access(all) fun hello(): String {
        return self.greeting
    }
}
```
---
### Q4
```swift
//For each of the functions below (numberOne, numberTwo, numberThree), follow the instructions.
pub contract Test {
  // TODO
  // Tell me whether or not this function will log the name.
  // name: 'Jacob'
  // Yes✔
  pub fun numberOne(name: String) {
    pre {
      name.length == 5: "This name is not cool enough."
    }
    log(name)
  }

  // TODO
  // Tell me whether or not this function will return a value.
  // name: 'Jacob'
  // Yes✔
  pub fun numberTwo(name: String): String {
    pre {
      name.length >= 0: "You must input a valid name."
    }
    post {
      result == "Jacob Tucker"
    }
    return name.concat(" Tucker")
  }

  pub resource TestResource {
    pub var number: Int
    // TODO
    // Tell me whether or not this function will log the updated number.
    // Also, tell me the value of `self.number` after it's run.
    // No, no log the update number❌ , just return 
    // The value is 1
    pub fun numberThree(): Int {
      post {
         result == before(self.number) + 1
      }
      self.number = self.number + 1
      return self.number
    }
    init() {
      self.number = 0
    }

  }
}
```
