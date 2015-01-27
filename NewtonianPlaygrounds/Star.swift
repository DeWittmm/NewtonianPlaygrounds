//
//  Sun.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/12/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

let StarCategory: UInt32 = 1 << 1

public class Star: ExposedPhysicsBody {
    // MARK: Types
    
    struct ResourceIdentifiers {
        static let sunImage = "sun"
    }

    
    // MARK: Initializers
    
    public init() {
        
        super.init(imageNamed: ResourceIdentifiers.sunImage)
        
        xScale = 0.5
        yScale = 0.5
        
        //Stars are not affected by Gravity
        physicsBody!.affectedByGravity = false
//        physicsBody!.linearDamping = 5.0
        physicsBody!.mass = 100000.0

        physicsBody!.categoryBitMask = StarCategory
        physicsBody!.contactTestBitMask = StarCategory        
    }

    required public init(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Convenience
}