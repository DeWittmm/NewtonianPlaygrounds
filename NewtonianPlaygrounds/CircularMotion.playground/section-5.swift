//Radial Gravity Field
world.activateGravityField()
world.field.strength = 1//units?

//Adjust earth properties
earth.mass = 50.0
earth.orbitRadius //units?
earth.position = Point(x: earth.orbitRadius, y: 0)

let xComponent = 15.0 //Ns
let yComponent = 6000.0 //Ns
let impulseVector = Vector(dx: xComponent, dy: yComponent)

//earth.applyForce(impulseVector)
earth.applyImpulse(impulseVector)
earth.applyAngularImpulse(50.0)

earth.whenPropertiesUpdate = {
    
    earth.velocity.dy
    earth.velocity.dx
    earth.angularVelocity
    earth.position.y
    earth.position.x
    
    return
}
