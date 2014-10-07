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
    sprite.position = CGPoint(x:CGRectGetMidX(scene.view!.frame), y:CGRectGetMidY(scene.view!.frame));
    
    let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
    
//    sprite.runAction(SKAction.repeatActionForever(action))
    
    scene.addChild(sprite)
}