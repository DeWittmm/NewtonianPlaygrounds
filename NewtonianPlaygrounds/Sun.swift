//
//  Sun.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/12/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

public class Sun: PhysicsBody {
    // MARK: Types
    
    struct ResourceIdentifiers {
        static let sunImage = "sun"
    }

    let SunCategory: UInt32 = 1 << 1

    
    // MARK: Initializers
    
    public init(scene: SKScene) {
        let center = CGPoint(x:CGRectGetMidX(scene.frame), y:CGRectGetMidY(scene.frame))
        
        super.init(imageNamed: ResourceIdentifiers.sunImage)
        
        position = center
        xScale = 0.5
        yScale = 0.5
        
        //Setup Actions
        addActions()
        
        physicsBody!.categoryBitMask = SunCategory
        physicsBody!.contactTestBitMask = SunCategory
        
        scene.addChild(self)
    }

    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Convenience
    
    override func addActions() {
    }
}