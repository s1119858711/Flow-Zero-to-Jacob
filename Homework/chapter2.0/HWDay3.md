## DAY3

1. In a script, initialize an array (that has length == 3) of your favourite people, represented as Strings, and log it.
    ```swift
    pub fun main()  {
        let favoPeople : {String:String} = {"Jacob":"Tucker", "Jacob1":"Tucker1","Jacob2":"Tucker3"}
        log(favoPeople)
    }
    ```
2. In a script, initialize a dictionary that maps the Strings Facebook, Instagram, Twitter, YouTube, Reddit, and LinkedIn to a UInt64 that represents the order in which you use them from most to least. For example, YouTube --> 1, Reddit --> 2, etc. If you've never used one before, map it to 0!
    ```swift
    pub fun main()  {
    let used : {String:UInt64} = {"Facebook":100, "Twitter":20,"Reddit":10,"Youtube":2,"Linkedln":1}
    log(used)
    }
    ```

3. Explain what the force unwrap operator ! does, with an example different from the one I showed you (you can just change the type).
    > The `!` has 2 functions, In one case, if it modifies `nil`, he will throw panic. The other is if it dose not modify nil,  it will remote optional data types, leaving only a certain data structure.

    > Example Code
    ```swift
    var name1: Int? = 3
    var unwrappedName1: Int = name1! // It removes the optional type And it will Int data type

    var name2: Int? = nil
    var unwrappedName2: Int = name2! // It will panic
    ```
4. Using this picture below, explain...
    1. The data type is not uniform.
    2. The data type of main function return is `String`, but `thing[0x03]` is `String?`
    3. Just change the **return thing[0x03] -->  return thing[0x03]!**
