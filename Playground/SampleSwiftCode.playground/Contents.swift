import Cocoa

var str = "Hello, playground"
var intValue = 5
let name = "Lanze"
print("My name is \(name)")

let constInt = 10
//constInt = 5
print("Value \(constInt)")

var varNumber : Int = 25
var varNumber2 : Int
varNumber2 = 20

var names : [String] = ["Ashish", "Lanze"]
names.append("Larry")
print(names)

for name in names {
    print(name)
}

var n = 0
while (n < 2) {
    print("N = \(n)")
    n += 1
}

// do while
n = 0
repeat {
    print("N = \(n)")
    n += 1
} while (n < 2)

// for loop
for i in 0..<2 {
    print(i)
}

func printMyName(name : String) -> String {
    print("Hello \(name)")
    return "\(name)"
}
printMyName(name: "Lanze")

class Employee {
    var firstName : String?
    var lastName : String?
    var id : Int = -1
    var designation : String?
    
    init(firstName: String, lastName: String, id: Int, designation: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.designation = designation
    }
}
var lanze = Employee(firstName: "Lanze", lastName: "Liu", id: 52, designation: "Student")
print(lanze.id)


