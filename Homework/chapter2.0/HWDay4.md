## DAY4

#### Contract Depolyed

```swift
pub contract Day4 {

    pub var profiles: {Address: Bank}
    
    pub struct Bank {
        pub let balance:Int64
        pub let stakeTime:Int64

        // You have to pass in 4 arguments when creating this Struct.
        init(_balance: Int64, _stakeTime: Int64) {
            self.balance = _balance
            self.stakeTime = _stakeTime
        }
    }

    pub fun add(account:Address, balance: Int64, stakeTime: Int64) {
        let newdeposit = Bank(_balance: balance, _stakeTime: stakeTime)
        self.profiles[account] = newdeposit
    }

    init() {
        self.profiles = {}
    }
}
```



#### Transaction Send

```swift
import Day4 from 0x04

transaction(account:Address,balance:Int64,stakeTime:Int64) {

    prepare(signer: AuthAccount) {
        log(signer)
    }

    execute {
        Day4.add(account: account, balance: balance, stakeTime:stakeTime)
        log("We're done.")
    }
}
```


### Script Executed
```swift
import Day4 from 0x04

pub fun main(account: Address): Day4.Bank {
    return Day4.profiles[account]!
}
```