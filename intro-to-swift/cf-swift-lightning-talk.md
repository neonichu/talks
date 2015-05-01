# Swift 🐦

---

>> “Swift’s clean slate [...] is an opportunity to reimagine how software development works.”

![](swift-bg.jpg)

---

# Smallest valid program

```swift
println("Hello, world")
```

---

# Variables

```swift
var languageName: String = "Swift"
let languageName: String = "Swift"
```

---

# Unicode identifiers

```swift
let languageName = "Swift"
var version = 1.0
let introduced = 2014
let isAwesome = true
let π = 3.1415927
let 🐶🐮 = "dogcow"
```

---

# String

```swift
let someString = "I appear to be a string"
// inferred to be of type String

urlRequest.HTTPMethod = "POST"

let components = "~/Documents/Swift".pathComponents
// ["~", "Documents", "Swift"]
```

---

# Character

```swift
for character in "🐭🐭🐭🐭🐭" { 
	println(character)
}
```

---

# Operators

```swift
let dog: Character = "🐶"
let cow: Character = "🐮"
let dogCow = dog + cow
// dogCow is "🐶🐮"
```

---

# String interpolation

```swift
let a = 7, b = 4
// "7 times 4 is 28"

let mathResult = "\(a) times \(b) is \(a * b)" !
// "7 times 4 is 28"
```

---

# Mutability

```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
constantString += " and another Highlander"
// error - constantString cannot be changed
```

---

# Native arrays and dictionaries

```swift
var names = ["Anna", "Alex", "Brian", "Jack"]
var numberOfLegs = ["ant": 6, "snake": 0, "cheetah": 4]
```

---

# Collections are typed

```swift
var names = ["Anna", "Alex", "Brian", "Jack", 42]
// ⚡️
```

---

# Loops

```swift
while !sated {
    eatCake()
}

for var doctor = 1; doctor <= 13; ++doctor {
    exterminate(doctor)
}
```

---

# For-In loops

```swift
for number in 1...5 {
    println("\(number) times 4 is \(number * 4)")
}

let numberOfLegs = ["ant": 6, "snake": 0, "cheetah": 4]
for (animalName, legCount) in numberOfLegs {
    println("\(animalName)s have \(legCount) legs")
}
```

---

# Mutating arrays

```swift
var shoppingList = ["Eggs", "Milk"]
println(shoppingList[0])
shoppingList.append("Flour")
shoppingList += ["Cheese", "Butter", "Chocolate Spread"]
shoppingList[0] = "Six eggs"
shoppingList[3...5] = ["Bananas", "Apples"]
```

---

# Optionals

```swift
let numberOfLegs = ["ant": 6, "snake": 0, "cheetah": 4]

let possibleLegCount: Int? = numberOfLegs["aardvark"]

if possibleLegCount == nil {
    println("Aardvark wasn't found")
} else {
    let legCount: Int = possibleLegCount!
    println("An aardvark has \(legCount) legs")
}
```

---

# Powerful switch statements

```swift
switch legCount {
  case 0:
  	println("It limps")
  case 1, 3, 5, 7, 9, 11, 13:
  	println("It slithers and slides around")
  case 2, 4, 6, 8, 10, 12, 14:
  	println("It walks")
}
```

- can also have ranges, strings, etc.
- must be exhaustive

---

# Functions

```swift
func sayHello() {
    println("Hello!")
}

sayHello()
```

---

# Functions

```swift
func buildGreeting(name: String = "World") -> String {
    return "Hello " + name
}

let greeting = buildGreeting()
println(greeting)
```

---

# Multiple return values

```swift
func refreshWebPage() -> (Int, String) {
    // ...try to refresh...
    return (200, "Success")
}

let (statusCode, message) = refreshWebPage()
println("Received \(statusCode): \(message)")
```

- tuples

---

# Closures

```swift
func repeat(count: Int, task: () -> ()) {
    for i in 0..count {
		task() }
	}

repeat(2) {
    println("Hello!")
}
```

---

# Classes

```swift
class Vehicle {
    var numberOfWheels = 0
    
    var description: String {
		get {
            return "\(numberOfWheels) wheels"
		} 
	}
}
```

- can inherit from `NSObject` or nothing (`SwiftObject` internally)
- all memory allocation is automatic using ARC

---

# Dot Syntax

```swift
let someVehicle = Vehicle()
println(someVehicle.description)
// 0 wheels

someVehicle.numberOfWheels = 2
println(someVehicle.description)
// 2 wheels
```

---

# Initialization

```swift
class Bicycle: Vehicle {
    init() {
        super.init()
        numberOfWheels = 2
	}
}
```

---

# Override keyword

```swift
class Car: Vehicle {
    var speed = 0.0
    
    init() {
        super.init()
        numberOfWheels = 4
    }

    override var description: String {
    	return super.description + ", \(speed) mph"
    }
}
```

---

# Property observers

```swift
class ParentsCar: Car {
    override var speed: Double  {
        willSet {
            if newValue > 65.0 {
                println("Careful now.")
			} 
		}
	} 
}
```

---

# Methods

```swift
class Counter {
    var count = 0

    func incrementBy(amount: Int) {
        count += amount
    }

    func resetToCount(count: Int) {
        self.count = count
    }
}
```

---

# Actually, it's a curried function

```swift
let c = Counter()
Counter.incrementBy(c)(2)
println(c.count)
```

![](sealion.jpg)

---

# Structures

```swift
struct Point {
    var x, y: Double
}

struct Size {
    var width, height: Double
}

struct Rect {
    var origin: Point
    var size: Size
}
```

- class: reference semantics
- struct: value semantics

---

# Enumerations

```swift
enum ControlCharacter: Character {
   case Tab = "\t"
   case Linefeed = "\n"
   case CarriageReturn = "\r"
}
```

---

# Enumerations: associated values

```swift
enum TrainStatus {
   case OnTime
   case Delayed(Int)
}

var status = TrainStatus()
println("The train is \(status.description)")
// The train is on time

status = .Delayed(42)
println("The train is now \(status.description)")
// The train is now delayed by 42 minute(s)
```

---

# Extensions

```swift
extension CGSize {
    mutating func increaseByFactor(factor: Int) {
        width *= factor
        height *= factor
    }
}
```

---

# Generics

```swift
struct Stack<T> {
    var elements = T[]()

    mutating func push(element: T) {
        elements.append(element)
	}
    
    mutating func pop() -> T {
        return elements.removeLast()
	} 
}
```

---

# Some more things

- Namespaces
- Operator overloading
- Bidirectional interoperability with Objective-C
- Can also replace C using `UnsafeMutablePointer`, etc.
- Playgrounds
- REPL

---

![](phtephen.jpg)
