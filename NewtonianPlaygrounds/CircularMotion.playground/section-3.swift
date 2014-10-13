

//Physics World 
let world = PhysicsWorld()

//Add Spaceship
let earth = Planet(.Earth)
let sun = Star()

world.addBody(earth)
world.addBody(sun)

XCPShowView("Physics World", world.view)
