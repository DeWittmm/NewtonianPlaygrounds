//
//  PhysicsScene.swift
//  Newtonian Playgrounds
//
//  Created by Michael DeWitt on 10/5/14.
//  Copyright (c) 2014 DeWitt.PHYS141.Playgrouds. All rights reserved.
//

import SpriteKit

public func addSpaceShip(scene: SKScene) {
    
    let sprite = SKSpriteNode(imageNamed:"Spaceship")
    
    sprite.xScale = 0.5
    sprite.yScale = 0.5
    sprite.position = CGPoint(x:100, y:10);
    
    let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
    sprite.runAction(SKAction.repeatActionForever(action))

    scene.addChild(sprite)
}

public func addBallon(scene: SKScene) {
    let texture = SKTexture(imageNamed: "balloon-blue")
    var balloon = SKSpriteNode(texture: texture)
    balloon.position = CGPoint(x:10, y:1)
    scene.addChild(balloon)
}