//
//  Earth.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/12/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

//Excerpt From: Apple Inc. “The Swift Programming Language.” iBooks. https://itun.es/us/jEUH0.l
public enum Planets: String {
    case Earth = "earth"
    case Mars = "mars"
    case Saturn = "saturn"
}

let PlanetCategory: UInt32 = 1 << 1

public class Planet: ExposedPhysicsBody {
    // MARK - Public Properties
    
    public var yearLength: Double = 365.25
    public var orbitRadius: CGFloat = 250
    
    // MARK - Internal Properties
    
    let yearToSecondRatio = 35.0

    // MARK - Initializers
    
    public init(_ planet: Planets) {

        super.init(imageNamed: planet.rawValue)
        
        xScale = 0.3
        yScale = 0.3
        
        physicsBody!.mass = 100.0
        physicsBody!.linearDamping = 0.0
        physicsBody!.angularDamping = 0.0
        physicsBody!.categoryBitMask = PlanetCategory
        physicsBody!.contactTestBitMask = PlanetCategory
        physicsBody!.allowsRotation = true
//        physicsBody!.dynamic = true;
        
        ///Planets must not be affected by gravity to behave correctly in a radial gravity field. 
        physicsBody!.affectedByGravity = false
    }

    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Actions

    public func freeOrbit() {
        let time = NSTimeInterval(self.yearLength / self.yearToSecondRatio)
        
        let rotate = SKAction.rotateByAngle(CGFloat(-M_PI*2), duration: time)
        
        let orbit = orbitRadius*2
        let circularPath = CGPathCreateWithEllipseInRect(CGRectMake(position.x-orbitRadius, position.y-orbitRadius, orbit, orbit), nil)
        let orbitAction = SKAction.followPath(circularPath, asOffset: false, orientToPath: true, duration: time)
        
        let actionGroup = SKAction.group([rotate, orbitAction])
        
        runAction(SKAction.repeatActionForever(actionGroup))
    }
}