import UIKit

// 1.  function tossCoin() ->  String
func tossCoin() -> String {
    print("Tossing a Coin!")
    let randomNumber = arc4random_uniform(2)
    let Coin: String
    if randomNumber == 0 {
        Coin = "Head"
    }else{
        Coin = "Tails"
    }
    
    return Coin
}
// 2.  function tossMultipleCoins(Int) -> Double
func tossMultipleCoins(num: Int) -> Double {
    var count = 0
    for _ in 1...num {
       let Coin = tossCoin()
        
        switch Coin {
          case "Head" :
             count += 1
             print("Head")
          case "Tails" : print("Tails")
        default: print("error")
        }
    }
    
    return Double(count) / Double(num)
}

print(tossMultipleCoins(num: 30))
