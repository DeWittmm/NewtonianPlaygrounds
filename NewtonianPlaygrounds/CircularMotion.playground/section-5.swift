//Radial Gravity Field
world.activateGravityField()
world.field.position
world.field.strength
world.field.falloff = 0.5

//Adjust earth properties
earth.mass = 50.0
earth.orbitRadius
earth.position = CGPoint(x: earth.orbitRadius, y: 0)

let xComponent = 15.0
let yComponent = 6000.0
let impulseVector = CGVector(dx: xComponent, dy: yComponent)

//earth.applyForce(impulseVector)
earth.applyImpulse(impulseVector)
earth.applyAngularImpulse(100.0)

earth.whenPropertiesUpdate = {
    
    earth.velocity.dy
    earth.velocity.dx
    earth.angularVelocity
    
    return
}
