import UIKit
import Foundation

func someFunction(_ flag: Bool) -> ([Int]) -> [Int] {
    func someFunction1(number: [Int]) -> [Int] {
        return number.flatMap { [$0, $0] }
    }

    func someFunction2(number: [Int]) -> [Int] {
        return number.flatMap { [$0, $0, $0] }
    }

    return flag ? someFunction1 : someFunction2
}

let function = someFunction(false)
let result = function([3, 2, 1])

for i in result {
    print(i)
}
