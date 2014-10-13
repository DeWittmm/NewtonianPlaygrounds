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
}

public class Planet: ExposedPhysicsBody {
    // MARK: Public Properties
    
    public var yearLength: Double = 365.25 {
        didSet {
            freeOrbit()
        }
    }
    
    // MARK: Internal Properties
    
    let yearToSecondRatio = 35.0
    let EarthCategory: UInt32 = 1 << 1

    
    // MARK: Initializers
    
    public init(_ planet: Planets) {

        super.init(imageNamed: planet.rawValue)
        
        xScale = 0.3
        yScale = 0.3
        
        physicsBody!.categoryBitMask = EarthCategory
        physicsBody!.contactTestBitMask = EarthCategory
        physicsBody!.allowsRotation = true
        physicsBody!.affectedByGravity = false
    }

    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Convenience
    
    public func freeOrbit() {
        let time = NSTimeInterval(self.yearLength / self.yearToSecondRatio)
        
        let rotate = SKAction.rotateByAngle(CGFloat(-M_PI*2), duration: time)
        
        let circlularPath = CGPathCreateWithEllipseInRect(CGRectMake(position.x-250, position.y-250, 500, 500), nil)
        let orbit = SKAction.followPath(circlularPath, asOffset: false, orientToPath: true, duration: time)
        
        let actionGroup = SKAction.group([rotate, orbit])
        
        runAction(SKAction.repeatActionForever(actionGroup))
    }
    
    func addPhysics() {
        physicsBody!.applyAngularImpulse(0.5)
    }
}