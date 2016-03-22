//
//  Character.swift
//  oop-own-app
//
//  Created by Mohamad Asyraaf on 22/3/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 10
    private var _name: String!
    
    var hp:Int{
    return _hp
    }
    
    var attackPower: Int{
        return _attackPower
    }
    
    var name: String{
        return _name
    }
    
    var isAlive:Bool{
        if self._hp <= 0 {
            return false
        }else{
            return true
        }
        
    }
    
   
    
    init(hp: Int,attackPower: Int,name:String!){
        self._hp = hp
        self._attackPower = attackPower
        self._name = name
        
    }
    
    func damaged(attackPowerFromAttacker:Int)->Bool{
       self._hp -= attackPowerFromAttacker
        
        return true
        
    }
    
    
    
    
    
}