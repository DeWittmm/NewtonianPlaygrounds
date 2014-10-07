//Demonstrate playground graphing
for x in 1...255 {
    let t = Double(x) * sin(Double(x) * M_PI_4/4)
}

//Physics World 
let world = PhysicsWorld()

XCPShowView("Physics World", world.view)
