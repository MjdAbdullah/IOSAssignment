import UIKit

// Declaring Array.
var NumArray = [Int]()

// Add the number from 1 to 255 in the array .
for i in 1...255 {
    NumArray.append(i)
}

// Swap two random values in the array 100 times
for i in 1...100 {
    let num1 = Int.random(in: 0..<NumArray.count)
    let num2 = Int.random(in: 0..<NumArray.count)
    if num1 != num2 {
        Shuffle(num1: num1, num2: num2)
    }else {
        Shuffle(num1: 0, num2: 1)
    }
}

// Remove the value "42" from the array and Print message .
for i in 0..<NumArray.count {
    if NumArray[i] == 49 {
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
        NumArray.remove(at: i)
        break
    }
}

print("The Array count : \(NumArray.count)")
print("Array : ")
print(NumArray)

// Function for swap the value
func Shuffle(num1: Int, num2: Int) {
    let temp = NumArray[num1]
    NumArray[num1] = NumArray[num2]
    NumArray[num2] = temp
}


