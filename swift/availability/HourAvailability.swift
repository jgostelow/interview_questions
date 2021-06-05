import Foundation

// Swift 3

protocol HoursMapper {
    /**
        Builds a mapping of tuples that describe hours when a user has
        chosen to be 'active' throughout a day
     
        - parameter active: hour ranges where start & end are 'active' (inclusive)
     
        - returns: Array of values describing availability on a per-hour level
     */
    func buildMap(active: (start: Int, end: Int)...) -> [Int]
}


class Availability : HoursMapper {

    func buildMap(active: (start: Int, end: Int)...) -> [Int] {

        var array : [Int] = []
        var isActive = false

        // Sort the input (to solve last testcase)
        let active = active.sorted(isOrderedBefore:{$1.0 > $0.0})

        for index in 0..<24 {
            for av in active {
                if index == av.0 {
                    isActive = true
                }
                if index == av.1 + 1 {
                    isActive = false
                }
            }

            if isActive {
                array.append(1)
            } else {
                array.append(0)
            }
        }
        return array
    }
}

let avail : HoursMapper = Availability()

// Not available at all
print(avail.buildMap()                 == [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])

// Available 2am-4am
print(avail.buildMap(active: (2, 4))   == [0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])

// Available 10am only
print(avail.buildMap(active: (10, 10)) == [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0])

// Available 12am-6am, 2pm-3pm
print(avail.buildMap(active: (0, 12), (14, 15)) == [1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0])

// Available all day
print(avail.buildMap(active: (13, 24), (0, 12)) == [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])