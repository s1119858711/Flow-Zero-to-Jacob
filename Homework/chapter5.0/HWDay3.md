## DAY3

### Q1
What does "force casting" with as! do? Why is it useful in our Collection? 🍕
- Its function lies in downcasts, which means transfer generic to specific. 

> **for example: @NonFungibleToken.NFT is a more generic type than @NFT. So, we have to use as!, which basically "downcasts" our generic type (@NonFungibleToken.NFT) to be a more specific type (@NFT).**
- In Collection, we want to store a specific NFT.

---

### Q2
What does auth do? When do we use it? 👀
 - got an authorized reference to the generic nft reference type by putting auth in front of it
 - When using references, if you want to downcast, you must have an auth reference.

---

### Q3
Word had Done
Word in the folder, please check 👣