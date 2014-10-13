

//Physics World 
let world = PhysicsWorld()

//Add Spaceship
let earth = Earth(world: world)
let sun = Sun(world: world)

XCPShowView("Physics World", world.view)

earth.velocity
earth.angularVelocity
