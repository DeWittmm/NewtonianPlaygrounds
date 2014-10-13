//
//  Earth.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/12/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

public class Earth: PhysicsBody {
    // MARK: Types
    
    struct ResourceIdentifiers {
        static let earthImage = "earth"
    }
    
    
    // MARK: Public Properties
    
    public let center:CGPoint
    public var yearLength: Double = 365.25 {
        didSet {
            addActions()
        }
    }
    
    // MARK: Internal Properties
    
    let yearToSecondRatio = 35.0
    let EarthCategory: UInt32 = 1 << 1

    
    // MARK: Initializers
    
    public init(scene: SKScene) {
        center = CGPoint(x:CGRectGetMidX(scene.frame), y:CGRectGetMidY(scene.frame))
        
        super.init(imageNamed: ResourceIdentifiers.earthImage)
        
        xScale = 0.3
        yScale = 0.3
        
        //Setup Actions
        addActions()
        
        physicsBody!.categoryBitMask = EarthCategory
        physicsBody!.contactTestBitMask = EarthCategory
        
        scene.addChild(self)
//        addPhysics()
    }

    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Convenience
    
    override func addActions() {
        let time = NSTimeInterval(self.yearLength / self.yearToSecondRatio)
        
        let rotate = SKAction.rotateByAngle(CGFloat(-M_PI*2), duration: time)
        
        let circlularPath = CGPathCreateWithEllipseInRect(CGRectMake(center.x-250, center.y-250, 500, 500), nil)
        let orbit = SKAction.followPath(circlularPath, asOffset: false, orientToPath: true, duration: time)
        
        let actionGroup = SKAction.group([rotate, orbit])
        
        runAction(SKAction.repeatActionForever(actionGroup))
    }
    
    func addPhysics() {
        physicsBody!.applyAngularImpulse(20.5)
    }
}