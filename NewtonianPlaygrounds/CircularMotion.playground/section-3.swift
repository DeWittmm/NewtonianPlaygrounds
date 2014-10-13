

//Physics World 
let world = PhysicsWorld()

//Add celestial bodies
let earth = Planet(.Earth)
let sun = Star()

world.addBody(earth)
world.addBody(sun)

XCPShowView("Physics World", world.view)
