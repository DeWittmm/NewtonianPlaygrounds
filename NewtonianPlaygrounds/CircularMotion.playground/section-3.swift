

//Physics World 
let world = PhysicsWorld()

//Add Spaceship
let earth = Earth(scene: world.scene)
let sun = Sun(scene: world.scene)

XCPShowView("Physics World", world.view)

earth.velocity
earth.angularVelocity
