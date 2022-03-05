## DAY2

**Contract Deployed to 0x03**

```swift
access(all) contract JacobTucker {

  pub let is : String

  // The init() function is required if the contract contains any fields.
  init() {
      self.is = "the bese guy in the world"
  }
}
```

**Script excuted to check data**

```swift
import JacobTucker from 0x03

pub fun main() : Bool {
  return JacobTucker.is == "the bese guy in the world"
}
```

**The snapshot**
<img src="https://gitee.com/song_tianyi/picture-host/raw/master/ndata/20220305131644.png"/>

