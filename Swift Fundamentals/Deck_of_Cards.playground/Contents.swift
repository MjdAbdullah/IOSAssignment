import UIKit

struct Card{
    let Color: String
    let Roll: Int
    
    init(Color: String){
        self.Color = Color
        switch Color {
        case "Blue" : self.Roll = Int.random(in: 1..<3) // Blue cards should have a roll value of either 1 or 2
        case "Red" : self.Roll = Int.random(in: 3..<5) // Red cards should have a roll value of either 3 or 4
        case "Green" : self.Roll = Int.random(in: 4..<7) // Green cards should have a roll value of 4, 5 or 6
        default : print("ERROR!")
            self.Roll = 0
        }
    }
}

class Deck{
    var cards: Array<Card>
    
    init(){
        var cards = Array<Card>()
        for _ in 1...10 {
            cards.append(Card(Color: "Red"))
            cards.append(Card(Color: "Blue"))
            cards.append(Card(Color: "Green"))
        }
        self.cards = cards
    }
    // method that selects the "top-most" card, removes it, and returns it
    func deal() -> Card{
        let temp = cards[0]
        cards.remove(at: 0)
        return temp
    }
    // method that returns true or false in regards to if the deck has ran out of cards.
    func isEmpty() -> Bool{
        if cards.count == 0 {
            return true
        }
        return false
    }
    // method that randomly reorders the deck's cards
    func shuffle(){
        for _ in 0..<cards.count {
            let num1 = Int.random(in: 0..<cards.count)
            let num2 = Int.random(in: 0..<cards.count)
            let temp = cards[num1]
            cards[num1] = cards[num2]
            cards[num2] = temp        }
    }
}

class Player{
    let name: String
    var hand = Array<Card>()
    
    init(name: String){
        self.name = name
    }
    // method of type (Deck) -> Card which draws a card from a deck, adds it to the players hand, and returns it
    func draw(cards: Deck) -> Card {
        if cards.isEmpty() {
            print("The Caeds is empty")
            return Card(Color: "null")
        }else{
            hand.append(cards.deal())
            print(hand[hand.count - 1])
            return hand[hand.count - 1]
        }
    }
    // method that returns a random number between 1 and 6
    func rollDice() -> Int{
        return Int.random(in: 1...8)    }
    // method of (String, Int) -> Int that will count all the card the player has which match the given color string and roll integer.
    func matchingCards(color: String, roll: Int) -> Int {
        var num = 0
        for i in 0..<hand.count {
            if hand[i].Color == color && hand[i].Roll == roll{
                num += 1
            }
        }
        return num
    }
}

let sara = Player(name: "Sara")
let myDeck = Deck()
myDeck.shuffle()
sara.draw(cards: myDeck)
sara.draw(cards: myDeck)
sara.draw(cards: myDeck)
sara.draw(cards: myDeck)
sara.draw(cards: myDeck)
sara.draw(cards: myDeck)
var roll = sara.rollDice()

print("Number of matching Cards with Roll \(roll) and color Green : \(sara.matchingCards(color: "Green", roll: roll))")
print("Number of matching Cards with Roll \(roll) and color Red : \(sara.matchingCards(color: "Red", roll: roll))")
print("Number of matching Cards with Roll \(roll) and color Blue : \(sara.matchingCards(color: "Blue", roll: roll))")
