## DAY3

### Q1
What do you have to do if you have resources "nested" inside of another resource? ("Nested resources")

> - In cadence , whenever you have resources inside of resources, you must declare a **destroy** function that manually destroys those "nested" resources with the destroy keywaor. 😘


---

### Q2
Brainstorm some extra things we may want to add to this contract. Think about what might be problematic with this contract and how we could fix it.

> - Maybe there should be two collections, one for storing any of they own mint, and the other for storing others' airdrops to themselves, and it is required that these two collection should communicate with each other, that is, the item of the two collections can be transferred to each other. 💕

> - When we need to get relavant information about specific nft, it is recommended to use the **reference** method 🥞