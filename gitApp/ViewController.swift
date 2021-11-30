//
//  ViewController.swift
//  gitApp
//
//  Created by Khamida on 30.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

final class LightOutsid{
    var intensity: Double = 1.0
    
    func switchOn(){
        print("Light switched on")
    }
    
    func switchOff(){
        print("Light switched off")
    }

}

final class HeatingCooling{
    var temperature: Double = 21.5
    var mode: String {
        return temperature >= 25 ? "heating" : "cooling"
    }
    
    func start(){
        print("Start \(mode)")
    }
    
    func stop(){
        print("Stop \(mode)")
    }
}

protocol Command{
    func execute()
}

final class SwitchOnLightCommand: Command {
    var light: LightOutsid
    
    init(light: LightOutsid){
        self.light = light
    }
    
    func execute(){
        light.switchOn()
    }
}

final class StartHeatingCommand: Command {
    var heater: HeatingCooling
    
    init(heater: HeatingCooling){
        self.heater = heater
    }
    
    func execute(){
        if heater.temperature < 25 {
            heater.temperature = 25
        }
        heater.start()
    }
}

final class Program{
    var commands: [Command] = []
    
    func start() {
        commands.forEach { $0.execute() }
    }
}

let light = LightOutsid()
let heater = HeatingCooling()

let lightOnCommand = SwitchOnLightCommand(light: light)
let heatCommand = StartHeatingCommand(heater: heater)

let eveningProgram = Program()
eveningProgram.commands.append(lightOnCommand)
eveningProgram.commands.append(heatCommand)
eveningProgram.start()
