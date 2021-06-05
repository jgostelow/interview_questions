import Foundation

/**
    A calculator that tracks a point in 2D space
*/
class DistanceCalculator {
  var x : Double = 0.0
  var y : Double = 0.0
  var path : [(Double, Double)] = []
  
  var delegate : DistanceDelegate?
  
  init() {
    path.append((x, y))
  }
  
  func move(x: Double, y: Double) {    
    path.append((x, y))
    delegate?.didMove(changeX:(x - self.x), changeY:(y - self.y))
    self.x = x
    self.y = y
  }
}

protocol DistanceDelegate {
  func didMove(changeX: Double, changeY: Double)
}

class Reporter : DistanceDelegate {
  func didMove(changeX: Double, changeY: Double) {
    print("Moved: x:\(changeX) y:\(changeY)")
  }
}

let calculator = DistanceCalculator()
calculator.delegate = Reporter()

// expect to output distance moved "Moved: 3.0, 4.0"
calculator.move(x: 3, y: 4)

// expect to output distance moved "Moved: 2.0, -1.0"
calculator.move(x: 5, y: 3)

let actualPath = calculator.path

// Returns the path [(0.0, 0.0), (3.0, 4.0), (5.0, 3.0)]
print(actualPath)