let world = PhysicsWorld()

//** Add celestial bodies **//
let sun = Star()
world.addBody(sun)

let earth = Planet(.Earth)
world.addBody(earth)

//let saturn = Planet(.Saturn)
//world.addBody(saturn)

XCPShowView("Physics World", world.view)
