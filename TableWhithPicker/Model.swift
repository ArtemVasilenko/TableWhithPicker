import Foundation

protocol DataTime {
    func createDataTime ()
}

struct Time {
    static var hour = [Int]()
    static var minute = [Int]()
    static var second = [Int]()
}

extension DataTime {
    func createDataTime () {
        for i in 0..<24 {
            Time.hour.append(i)
        }
        for i in 0..<60{
            Time.minute.append(i)
            Time.second.append(i)
        }
    }
}
