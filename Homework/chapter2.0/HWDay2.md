## DAY3

1. Explain why we wouldn't call changeGreeting in a script.
>  `changeGreeting` aim to change the variable state in blockchain. but scirpt could only read data. 🐱‍🚀

2. What does the AuthAccount mean in the prepare phase of the transaction?
>  To access the information/data in the your account. 🍨

3. What is the difference between the prepare phase and the execute phase in the transaction?
>  **prepare phase**: To access the information/data in your account.  🧇

>  **execute phase**: It can call functions and do stuff to change the data on the blockchain.👀

4. Contract Depolyed
    ```swift
    pub contract HelloWorld {

    pub var greeting: String
    pub var myNumber: Int

    pub fun changeGreeting(newGreeting: String) {
        self.greeting = newGreeting
    }

    pub fun updateMyNumber(newNumber: Int){
        self.myNumber = newNumber
    }

    init() {
        self.greeting = "Hello, World!"
        self.myNumber = 0
    }
    }
    ```
    Transaction Code
    ```swift
    import HelloWorld from 0x01

    transaction(newNumber:Int) {

    prepare(acct: AuthAccount) {}

    execute {
        HelloWorld.updateMyNumber(newNumber: newNumber)
    }
    }
    ```
    Script Executed
    ```swift
    import HelloWorld from 0x01

    pub fun main() : Int {
    return HelloWorld.myNumber
    }
    ```
    <img src="https://gitee.com/song_tianyi/picture-host/raw/master/ndata/20220305135455.png"/>