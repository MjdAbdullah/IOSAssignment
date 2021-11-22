import UIKit

print("Enter the String for check:")
let text = "racecar"
print(text)

if checkPalindrome(Text: text) {
    print("\(text) is a palindrome")
}else{
    print("\(text) is not a palindrome")
}

// without recursion
func checkPalindrome(Text: String) -> Bool{
    
    let TextArray = Array(Text)
    var min = 0
    var max = TextArray.count - 1
    
    while max != min {
        if TextArray[min] == TextArray[max]{
            min += 1
            max -= 1
        }else {
            return false
        }
    }
    return true
}

// with recursion
// least amount of code possible
func checkPalindrome2(Text: String) -> Bool{
    return Text == String(Text.reversed())
}
