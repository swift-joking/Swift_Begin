//
//protocol ExampleProtocl {
//    var simpleDescription: String { get }
//    mutating func adjust()
//}
//
//class SimpleClass: ExampleProtocl {
//    var simpleDescription: String = "A very simple class."
//    var anotherProperty: Int = 69000
//
//    func adjust() {
//        simpleDescription += " Now 100% adjusted."
//    }
//}
//
//var a = SimpleClass()
//a.adjust()
//let aDescription = a.simpleDescription
//
//struct SimpleStructure: ExampleProtocl {
//    var simpleDescription: String = "A simple structure"
//    mutating func adjust() {
//        simpleDescription += " (adjusted)"
//    }
//}
//
//var b = SimpleStructure()
//b.adjust()
//let bDes = b.simpleDescription
//
//extension Int: ExampleProtocl {
//    var simpleDescription: String {
//        return "The number \(self)"
//    }
//
//    mutating func adjust() {
//        self += 42
//    }
//}
//
//print(7.simpleDescription)
//
//let protocolValue: ExampleProtocl = a
//print(protocolValue.simpleDescription)
//
//

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job send"
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

do {
    try send(job: 1040, toPrinter: "Bi Sheng")
} catch  {
    print(error)
}

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)



func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}

anyCommonElements([1, 2, 3], [3])
