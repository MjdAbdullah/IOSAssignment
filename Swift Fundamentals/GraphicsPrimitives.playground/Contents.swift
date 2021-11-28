import UIKit

struct Point{
    var X: Double
    var Y: Double
    
    init(X: Double, Y:Double){
        self.X = X
        self.Y = Y
    }
}

struct Line{
    var Start: Point
    var End: Point
    
    init(Start: Point, End: Point){
        self.Start = Start
        self.End = End
    }
    
    func length() -> Double{
        let point1 = pow((End.X - Start.X),2)
        let point2 = pow((End.Y - Start.Y),2)
        return sqrt(point1 + point2)
    }
}

struct Triangle{
    var Points: Array<Point>
    
    init(Points: Array<Point>){
        self.Points = Points
        if Points.count < 3 {
            print("There are missing points.")
            var num = Points.count
            while (num < 3){
                self.Points.append(Point(X: Double(arc4random_uniform(11)), Y: Double(arc4random_uniform(11)) ) )
                print("Add : \(self.Points[num])")
                num += 1
            }
        }
    }
    
    // Optional
    func area() -> Double {
        // get the lines lengths
        let line1 = Line(Start: Points[0], End: Points[1]).length()
        let line2 = Line(Start: Points[1], End: Points[2]).length()
        let line3 = Line(Start: Points[2], End: Points[0]).length()
        
        // calculation s
        let s = (line1 + line2 + line3) / 2
        // calculation area
        return sqrt(s*((s - line1)*(s - line2)*(s - line3)))
    }
}

let myTriangle = Triangle(Points: Array<Point>())
myTriangle.area()
