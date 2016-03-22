//
//  ViewController.swift
//  oop-own-app
//
//  Created by Mohamad Asyraaf on 22/3/16.
//  Copyright © 2016 Mohamad Asyraaf bin Abdul Rahman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var orcmanLbl: UILabel!
    
    @IBOutlet weak var herculesLbl: UILabel!
    @IBOutlet weak var orcCharBtn: UIButton!
    @IBOutlet weak var herculesCharBtn: UIButton!
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerAttackBtn: UIButton!
    @IBOutlet weak var enemyAttackBtn: UIButton!
    
    @IBOutlet weak var opponentImgView: UIImageView!
    
    @IBOutlet weak var playerImgView: UIImageView!
    
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    
    var characterChosen: Character!
    var enemyCharacter: Character!
    var mediaPlayer: AVAudioPlayer!
    var attackSound: AVAudioPlayer!
    
    
    @IBAction func chooseOrcChar(sender: AnyObject) {
        characterChosen = Character(hp: 90, attackPower: 20, name: "Orc Man")
        
        printLbl.text = "Fight!"
        showSecondScreen()
         playerImgView.image = UIImage(named: "enemy.img")
        
    }
    
    @IBAction func chooseHerculesChar(sender: AnyObject) {
        characterChosen = Character(hp: 120, attackPower: 30, name: "Hercules")
       
        printLbl.text = "Fight!"
        showSecondScreen()
        playerImgView.image = UIImage(named: "player.img")
    }
    
    @IBAction func playerAttack(sender: AnyObject) {
        attackSound.play()
        if enemyCharacter.damaged(characterChosen.attackPower){
            printLbl.text = "\(characterChosen.name) has attacked \(enemyCharacter.name) for \(characterChosen.attackPower) damage"
            enemyHpLbl.text = "\(enemyCharacter.hp) HP"
            
        }
        
        if !enemyCharacter.isAlive {
            printLbl.text = "\(characterChosen.name) has defeated \(enemyCharacter.name)"
            
        }
        
    }
    
    @IBAction func enemyAttack(sender: AnyObject) {
        attackSound.play()
        if characterChosen.damaged(enemyCharacter.attackPower){
            printLbl.text = "\(enemyCharacter.name) has attacked \(characterChosen.name) for \(enemyCharacter.attackPower) damage"
            playerHpLbl.text = "\(characterChosen.hp) HP"
            
        }
        
        if !characterChosen.isAlive {
            printLbl.text = "\(enemyCharacter.name) has defeated \(characterChosen.name)"
            
        }
    }
    
    func showSecondScreen(){
        orcmanLbl.hidden = true
        herculesLbl.hidden = true
        orcCharBtn.hidden = true
        herculesCharBtn.hidden = true
        printLbl.text = "Fight!"
        opponentImgView.hidden = false
        playerImgView.hidden = false
        enemyAttackBtn.hidden = false
        playerAttackBtn.hidden = false
        enemyHpLbl.hidden = false
        playerHpLbl.hidden = false
        
        
        enemyCharacter = Character(hp: 90, attackPower: 20, name: "Opponent")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orcmanLbl.hidden = false
        herculesLbl.hidden = false
        orcCharBtn.hidden = false
        herculesCharBtn.hidden = false
        opponentImgView.hidden = true
        playerImgView.hidden = true
        enemyAttackBtn.hidden = true
        playerAttackBtn.hidden = true
        enemyHpLbl.hidden = true
        playerHpLbl.hidden = true
        
        
        
       //background Music
        let path = NSBundle.mainBundle().pathForResource("BgMusic", ofType: "mp3")
        let Url = NSURL(fileURLWithPath: path!)
        do {
            try mediaPlayer = AVAudioPlayer(contentsOfURL: Url)
        }catch let err as NSError{
            print(err.debugDescription)
        }
        mediaPlayer.numberOfLoops = -1 //anything less than 0 causes it to unlimited looping
        mediaPlayer.play()
        
        
        //Attack Sound for music
        let attackpath = NSBundle.mainBundle().pathForResource("AttackSound", ofType: "wav")
        let attackUrl = NSURL(fileURLWithPath: attackpath!)
        do{
            try attackSound = AVAudioPlayer(contentsOfURL: attackUrl)
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
        
    }
    
  

    
}


