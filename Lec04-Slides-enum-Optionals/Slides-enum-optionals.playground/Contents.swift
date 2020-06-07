import Foundation

var str = "Hello, playground"

//  ************************************************************
//  MARK: ENUM-01 - Another variety of data structure in addition to struct and class
//

enum FastFoodMenuItemEnum {
  case hamburger
  case fries
  case drink
  case cookie
}



//  ************************************************************
//  MARK: ENUM-02 - Associated data
//

enum FastFoodMenuItem {
  case hamburger(patties: Int)
  case fries(size: FryOrderSize)
  case drink(String, ounces: Int)
  case cookie
}

enum FryOrderSize {
  case large
  case small
}



//  ************************************************************
//  MARK: ENUM-03 - Setting the value of an enum
//

let menuItem: FastFoodMenuItem = FastFoodMenuItem.hamburger(patties: 2)
var otherItem: FastFoodMenuItem = FastFoodMenuItem.cookie



//  ************************************************************
//  MARK: ENUM-04 - Setting the value of an enum
//         - Infer the type on one side of the assignment or the other
//

let menuItem4: FastFoodMenuItem = FastFoodMenuItem.hamburger(patties: 2)
var otherItem4: FastFoodMenuItem = FastFoodMenuItem.cookie

// ERROR: Reference to member 'cookie' cannot be resolved without a contextual type
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
// var yetAnotherItem = .cookie
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *



//  ************************************************************
//  MARK: ENUM-05 - Checking an enum’s state  - Check hamburger(patties: 2)
//

print("\n\n --- ENUM-05 - Checking an enum’s state - Check hamburger(patties: 2) --- \n")

var menuItem5 = FastFoodMenuItem.hamburger(patties: 2)
switch menuItem5 {
case FastFoodMenuItem.hamburger(patties: 2):
  print("burger")
case FastFoodMenuItem.fries(size: .large):
  print("fries")
case FastFoodMenuItem.drink("Coke", ounces: 4):
  print("drink")
case FastFoodMenuItem.cookie:
  print("cookie")
default:
  print("no menu item")
}
// Prints out: burger



//  ************************************************************
//  MARK: ENUM-06 - Checking an enum’s state - Infer inside the switch
//

print("\n\n --- ENUM-06 - Checking an enum’s state - Infer inside the switch --- \n")

var menuItem6 = FastFoodMenuItem.fries(size: .large)
switch menuItem6 {
case .hamburger(patties: 2):
  print("burger")
case .fries(size: .large):
  print("fries")
case .drink("Coke", ounces: 4):
  print("drink")
case .cookie:
  print("cookie")
default:
  print("no menu item")
}
// Prints out: fries



//  ************************************************************
//  MARK: ENUM-07 - break
//

print("\n\n --- ENUM-07 - break --- \n")

var menuItem7 = FastFoodMenuItem.hamburger(patties: 2)
switch menuItem7 {
case .hamburger(patties: 2):
  break
case .fries(size: .large):
  print("fries")
case .drink("Coke", ounces: 4):
  print("drink")
case .cookie:
  print("cookie")
default:
  print("no menu item")
}
// Prints out: " "



//  ************************************************************
//  MARK: ENUM-08 - default
//

print("\n\n --- ENUM-08 - default --- \n")

var menuItem8 = FastFoodMenuItem.cookie
switch menuItem8 {
case .hamburger(patties: 2):
  break
case .fries(size: .large):
  print("fries")
default:
  print("other")
}
// Prints out: other



//  ************************************************************
//  MARK: ENUM-09 - Associated data with 'let'
//

print("\n\n --- ENUM-09a - Associated data with 'let' --- \n")

var menuItem9a = FastFoodMenuItem.hamburger(patties: 3)
switch menuItem9a {
case .hamburger(let pattyCount):
  print("a burger with \(pattyCount) patties!")
case .fries(let size):
  print("a \(size) order of fries!")
case .drink(let brand, let ounces):
  print("a \(ounces)oz \(brand)")
case .cookie:
  print("a cookie!")
}
// Prints out: a burger with 3 patties!



print("\n\n --- ENUM-09b - Associated data with 'let' --- \n")

var menuItem9b = FastFoodMenuItem.drink("Coke", ounces: 32)
switch menuItem9b {
case .hamburger(let pattyCount):
  print("a burger with \(pattyCount) patties!")
case .fries(let size):
  print("a \(size) order of fries!")
case .drink(let brand, let ounces):
  print("a \(ounces)oz \(brand)")
case .cookie:
  print("a cookie!")
}
// Prints out: a 32oz Coke



//  ************************************************************
//  MARK: ENUM-10 - Methods yes, (stored) Properties no
//

print("\n\n --- ENUM-10 - Methods yes, (stored) Properties no --- \n")


enum FastFoodMenuItemWithMethods {
  case hamburger(patties: Int)
  case fries(size: FryOrderSize)
  case drink(String, ounces: Int)
  case cookie
  
  
  func isIncludedInSpecialOrder(number: Int) -> Bool {
    switch self {
    case .hamburger(let pattyCount):
      return pattyCount == number
    case .fries, .cookie:
      return true
    case .drink(_, let ounces):
      return ounces == 16
    }
  }
  
}

var menuItem10a = FastFoodMenuItemWithMethods.hamburger(patties: 2)

if menuItem10a.isIncludedInSpecialOrder(number: 2) {
  print("10a. yes, this menu item is include in special order")
}
// Prints out: yes, this menu item is include in special order


var menuItem10b = FastFoodMenuItemWithMethods.drink("Coke", ounces: 16)

if menuItem10b.isIncludedInSpecialOrder(number: 16) {
  print("10b. yes, this menu item is include in special order")
}
// Prints out: yes, this menu item is include in special order



//  ************************************************************
//  MARK: ENUM-11 - CaseIterable - allCases
//

print("\n\n --- ENUM-11 - CaseIterable - allCases --- \n")

enum TeslaModel: CaseIterable {
  case X
  case S
  case Three
  case Y
}

for model in TeslaModel.allCases {
  print("model: \(model)")
}
// Prints out:
// model: X
// model: S
// model: Three
// model: Y



//  ************************************************************
//  MARK: OPTIONAL-01 - Declaring with the syntax T
//

print("\n\n --- OPTIONAL-01 - Declaring with the syntax T --- \n")

var hello1a: String? = nil
var hello1b: String?
var hello1c: Optional<String> = .none

var hello1d: String? = "hello"
var hello1f: Optional<String> = .some("hello")



//  ************************************************************
//  MARK: OPTIONAL-02 - Accessing the values
//

print("\n\n --- OPTIONAL-02 - Accessing the values --- \n")

let hello2: String? = "Hi"
print(hello2!)


if let safeHello2 = hello2 {
  print(safeHello2)
} else {
  // do something else
}



//  ************************************************************
//  MARK: OPTIONAL-03 - Optional defaulting
//

print("\n\n --- OPTIONAL-03 - Optional defaulting --- \n")

let x: String? = nil
let y = x ?? "foo"
print("y: \(y)")
// Prints out: y: foo
