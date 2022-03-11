## DAY2

### Q1
What does .link() do? 🐱‍👓
> - It make me feel like a pointer, pointing to the needed objects in storage space from public or private space

### Q2
In your own words (no code), explain how we can use resource interfaces to only expose certain things to the /public/ path.
> - First, we need to define the resource we want and the corresponding interfaces
> - Secondly, when you **link**, you will only link to public in the form of **&Resource{interface}** 
> - Finally, when calling, people can only call what we have exposed.


### Q3

**Contract Source Code**
```swift
//Deploy a contract that contains a resource that implements a resource interface. Then, do the following:

//1. In a transaction, save the resource to storage and link it to the public with the restrictive interface.

//2. Run a script that tries to access a non-exposed field in the resource interface, and see the error pop up.

//3. Run the script and access something you CAN read from. Return it from the script.
pub contract Day2 {

  pub resource interface ITest {
    pub var name: String
  }

  pub resource Test: ITest {
    pub var name: String
    pub var notName: String

    pub fun changeName(newName: String) {
      self.name = newName
      
    }

    init() {
      self.name = "Hi"
      self.notName = "Hello, World"
    }
  }

  pub fun createTest(): @Test {
    return <- create Test()
  }

}
```
---
**Transaction Code**
```swift
import Day2 from 0x02
transaction() {
  prepare(signer: AuthAccount) {
    // Save the resource to account storage
    signer.save(<- Day2.createTest(), to: /storage/MyTestResource)

    // See what I did here? I only linked `&Stuff.Test{Stuff.ITest}`, NOT `&Stuff.Test`.
    // Now the public only has access to the things in `Stuff.ITest`.
    signer.link<&Day2.Test{Day2.ITest}>(/public/MyTestResource, target: /storage/MyTestResource)
  }
  execute {
  }
}
```
---
**Script CODE--Worked**
```swift
import Day2 from 0x02
pub fun main(address: Address):String {
  let publicCapability: Capability<&Day2.Test{Day2.ITest}> =
    getAccount(address).getCapability<&Day2.Test{Day2.ITest}>(/public/MyTestResource)

  let testResource: &Day2.Test{Day2.ITest} = publicCapability.borrow() ?? panic("The capability doesn't exist or you did not specify the right type when you got the capability.")

  // This works because `name` is in `&Stuff.Test{Stuff.ITest}`
  return testResource.name
}
```
---
**Script CODE--NOT exposed**
```swift
import Day2 from 0x02
pub fun main(address: Address):String {
  let publicCapability: Capability<&Day2.Test{Day2.ITest}> =
    getAccount(address).getCapability<&Day2.Test{Day2.ITest}>(/public/MyTestResource)

  let testResource: &Day2.Test{Day2.ITest} = publicCapability.borrow() ?? panic("The capability doesn't exist or you did not specify the right type when you got the capability.")

  // This works because `name` is in `&Stuff.Test{Stuff.ITest}`
  return testResource.notName
}
```