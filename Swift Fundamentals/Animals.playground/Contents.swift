import UIKit

class Animal{
    let name: String
    var healt: Int
    init(name: String, healt: Int){
        self.healt = healt
        self.name = name
    }
    func displayHealth(){
        print("The healt \(healt)")
    }
}

class Cat: Animal{
    override init(name: String, healt: Int) {
        super.init(name: name, healt: healt)
    }
    func growl(){
        print("Rawr!")
    }
    func run(){
        healt -= 10
        print("Running")
    }
}

class Cheetah: Cat{
    init(name: String) {
        super.init(name: name, healt: 150)
    }
    override func run() {
        if healt < 50 {
            print("Canmt run, heait = \(healt)")
        }else{
            healt -= 50
            print("Running Fast")
        }
    }
    func sleep(){
        if healt >= 200{
            print("The healt is over 200")
        }else{
            healt += 50
        }
    }
}

class Lion: Cat{
    override func growl() {
        print("ROAR!!!! I am the King of the Jungle")
    }
    init(name: String) {
        super.init(name: name, healt: 200)
    }
}

let myCheetah = Cheetah(name: "LOLO")
myCheetah.run()
myCheetah.run()
myCheetah.run()
myCheetah.run()
myCheetah.displayHealth()

let myLion = Lion(name: "Simba")
myLion.run()
myLion.run()
myLion.run()
myLion.growl()
