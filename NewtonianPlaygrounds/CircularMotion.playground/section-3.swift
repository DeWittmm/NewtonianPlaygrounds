

//Physics World 
let world = PhysicsWorld()

//Add Spaceship
addSunToSolarSystem(world.scene)
addEarthToSolarSystem(world.scene)


XCPShowView("Physics World", world.view)
