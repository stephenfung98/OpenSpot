//
//  VehicleInformationViewController.swift
//  OpenSpot
//
//  Created by Stephen Fung on 3/9/19.
//  Copyright © 2019 Jay Lliguichushca. All rights reserved.
//

import UIKit
import Firebase

class VehicleInformationViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var license: UITextField!
    @IBOutlet weak var make: UITextField!
    @IBOutlet weak var model: UITextField!
    @IBOutlet weak var color: UITextField!
    
    var fullName = String?("")
    var email = String?("")
    var dateOfBirth = String?("")
    
    let statesArr = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut","District of Columbia","Delaware", "Florida", "Georgia", "Guam","Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana","Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina","North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma","Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas","Utah","Virginia", "Virgin Islands","Vermont","Washington","Wisconsin","West Virginia","Wyoming"]
    
    var makeArr = ["Acura", "Alfa Romeo", "Aston Martin", "Audi",  "Bentley", "BMW", "Buick", "Cadillac", "Chevrolet", "Chrysler", "Dodge","Ferrari", "FIAT","Ford","Freightliner","Genesis","GMC","Honda", "Hyundai","INFINITI","Jaguar","Jeep","Kia","Lamborghini","Land Rover","Lexus","Lincoln","Lotus", "Maserati","MAZDA","McLaren","Mercedes-Benz","MINI","Mitsubishi","Nissan","Porsche","Ram","Rolls-Royce","smart","Subaru","Tesla","Toyota","Volkswagen","Volvo"]
    
    var acuraModels = ["ILX", "MDX", "MDX Sport Hybrid", "NSX", "RDX", "RLX", "RLX Sport Hybrid", "TLX"]
    var alfaRomeoModels = ["4C", "4C Spider", "Giulia", "Stelvio"]
    var astonMartinModels = ["DB11", "Vanquish S"]
    var audiModels = ["A3", "A3 Sportback e-tron", "A4", "A4 allroad", "A5", "A6", "A7", "A8", "e-tron", "Q3", "Q5", "Q7", "Q8", "R8", "RS 3", "RS 5", "RS 7", "S3", "S4", "S5", "S6", "S7", "S8", "SQ5", "TT"]
    var bentleyModels = ["Bentayga", "Continental", "Flying Spur", "Mulsanne"]
    var bmwModels = ["2 Series", "3 Series", "4 Series", "5 Series", "6 Series", "7 Series", "i3", "i8", "M2", "M3", "M4", "M5", "M6", "X1", "X2", "X3", "X4", "X5", "X5 M", "X6", "X6 M"]
    var buickModels = ["Cascada", "Enclave", "Encore", "Envision", "LaCrosse", "Regal Sportback", "Regal TourX"]
    var cadillacModels = ["ATS", "ATS-V", "CT6", "CTS", "CTS-V", "Escalade", "Escalade ESV", "XT4", "XT5", "XTS"]
    var chevroletModels = ["Blazer", "Bolt EV", "Camaro", "City Express", "Colorado Crew Cab", "Colorado Extended Cab", "Corvette", "Cruze", "Equinox", "Express 2500 Cargo", "Express 2500 Passenger", "Express 3500 Cargo", "Express 3500 Passenger", "Impala", "Malibu", "Silverado 1500 Crew Cab", "Silverado 1500 Double Cab", "Silverado 1500 LD Double Cab", "Silverado 1500 Regular Cab", "Silverado 2500 HD Crew Cab", "Silverado 2500 HD Double Cab", "Silverado 2500 HD Regular Cab", "Silverado 3500 HD Crew Cab", "Silverado 3500 HD Double Cab", "Silverado 3500 HD Regular Cab", "Sonic", "Spark", "Suburban", "Tahoe", "Traverse", "Trax", "Volt"]
    var chryslerModels = ["300", "Pacifica", "Pacifica Hybrid"]
    var dodgeModels = ["Challenger", "Charger", "Durango", "Grand Caravan Passenger", "Journey"]
    var ferrariModels = ["488 GTB", "488 Spider", "812 Superfast", "California", "F12berlinetta", "GTC4Lusso", "Portofino"]
    var fiatModels = ["124 Spider", "500", "500 Abarth", "500c", "500c Abarth", "500e", "500L", "500X"]
    var fordModels = ["C-MAX Hybrid", "EcoSport", "Edge", "Escape", "Expedition", "Expedition MAX", "Explorer", "F150 Regular Cab", "F150 Super Cab", "F150 SuperCrew Cab", "F250 Super Duty Crew Cab", "F250 Super Duty Regular Cab", "F250 Super Duty Super Cab", "F350 Super Duty Crew Cab", "F350 Super Duty Regular Cab", "F350 Super Duty Super Cab", "F450 Super Duty Crew Cab", "Fiesta", "Flex", "Focus", "Fusion", "Fusion Energi", "Mustang", "Ranger SuperCab", "Ranger SuperCrew", "Taurus", "Transit 150 Van", "Transit 150 Wagon", "Transit 250 Van", "Transit 350 HD Van", "Transit 350 Van", "Transit 350 Wagon", "Transit Connect Cargo", "Transit Connect Passenger"]
    var freightlinerModels = ["Sprinter 2500 Cargo", "Sprinter 2500 Crew", "Sprinter 2500 Passenger", "Sprinter 3500 Cargo", "Sprinter 3500XD Cargo", "Sprinter WORKER Cargo"]
    var genesisModels = ["G70", "G80", "G90"]
    var gmcModels = ["Acadia", "Canyon Crew Cab", "Canyon Extended Cab", "Savana 2500 Cargo", "Savana 2500 Passenger", "Savana 3500 Cargo", "Savana 3500 Passenger", "Sierra 1500 Crew Cab", "Sierra 1500 Double Cab", "Sierra 1500 Regular Cab", "Sierra 2500 HD Crew Cab", "Sierra 2500 HD Double Cab", "Sierra 2500 HD Regular Cab", "Sierra 3500 HD Crew Cab", "Sierra 3500 HD Double Cab", "Sierra 3500 HD Regular Cab", "Terrain", "Yukon", "Yukon XL"]
    var hondaModels = ["Accord", "Accord Hybrid", "Civic", "Civic Type R", "Clarity Electric", "Clarity Fuel Cell", "Clarity Plug-in Hybrid", "CR-V", "Fit", "HR-V", "Insight", "Odyssey", "Passport", "Pilot", "Ridgeline"]
    var hyundaiModels = ["Accent", "Elantra", "Elantra GT", "Ioniq Electric", "Ioniq Hybrid", "Ioniq Plug-in Hybrid", "Kona", "Kona Electric", "NEXO", "Santa Fe", "Santa Fe Sport", "Santa Fe XL", "Sonata", "Sonata Hybrid", "Sonata Plug-in Hybrid", "Tucson", "Veloster"]
    var infinitiModels = ["Q50", "Q60", "Q70", "QX30", "QX50", "QX60", "QX80"]
    var jaguarModels = ["E-PACE", "F-PACE", "F-TYPE", "I-PACE", "XE", "XF", "XJ"]
    var jeepModels = ["Cherokee", "Compass", "Grand Cherokee", "Renegade", "Wrangler", "Wrangler Unlimited"]
    var kiaModels = ["Cadenza", "Forte", "Forte5", "K900", "Niro", "Niro Plug-in Hybrid", "Optima", "Optima Hybrid", "Optima Plug-in Hybrid", "Rio", "Sedona", "Sorento", "Soul", "Soul EV", "Sportage", "Stinger", "Telluride"]
    var lamborghiniModels = ["Aventador", "Huracan"]
    var landRoverModels = ["Discovery", "Discovery Sport", "Range Rover", "Range Rover Evoque", "Range Rover Sport", "Range Rover Velar"]
    var lexusModels = ["ES", "GS", "GX", "IS", "LC", "LS", "LX", "NX", "RC", "RX", "UX"]
    var lincolnModels = ["Aviator", "Continental", "MKC", "MKT", "MKX", "MKZ", "Nautilus", "Navigator", "Navigator L"]
    var lotusModels = ["Evora 400"]
    var maseratiModels = ["Ghibli", "GranTurismo", "Levante", "Quattroporte"]
    var mazdaModels = ["CX-3", "CX-5", "CX-9", "MAZDA3", "MAZDA6", "MX-5 Miata", "MX-5 Miata RF"]
    var mclarenModels = ["570GT", "570S", "720S"]
    var mercedesbenzModels = ["A-Class", "C-Class", "CLA", "CLS", "E-Class", "G-Class", "GLA", "GLC", "GLC Coupe", "GLE", "GLS", "Mercedes-AMG C-Class", "Mercedes-AMG CLA", "Mercedes-AMG CLS", "Mercedes-AMG E-Class", "Mercedes-AMG G-Class", "Mercedes-AMG GLA", "Mercedes-AMG GLC", "Mercedes-AMG GLC Coupe", "Mercedes-AMG GLE", "Mercedes-AMG GLE Coupe", "Mercedes-AMG GLS", "Mercedes-AMG GT", "Mercedes-AMG S-Class", "Mercedes-AMG SL", "Mercedes-AMG SLC", "Mercedes-Maybach S-Class", "Metris Cargo", "Metris Passenger", "Metris WORKER Cargo", "Metris WORKER Passenger", "S-Class", "SL", "SLC", "Sprinter 2500 Cargo", "Sprinter 2500 Crew", "Sprinter 2500 Passenger", "Sprinter 3500 Cargo", "Sprinter 3500 XD Cargo", "Sprinter WORKER Cargo"]
    var miniModels = ["Clubman", "Convertible", "Countryman", "Hardtop 2 Door", "Hardtop 4 Door"]
    var mitsubishiModels = ["Eclipse Cross", "Mirage", "Mirage G4", "Outlander", "Outlander PHEV", "Outlander Sport"]
    var nissanModels = ["370Z", "Altima", "Armada", "Frontier Crew Cab", "Frontier King Cab", "GT-R", "Kicks", "LEAF", "Maxima", "Murano", "NV1500 Cargo", "NV200", "NV2500 HD Cargo", "NV3500 HD Cargo", "NV3500 HD Passenger", "Pathfinder", "Rogue", "Rogue Sport", "Sentra", "Titan Crew Cab", "Titan King Cab", "TITAN Single Cab", "TITAN XD Crew Cab", "TITAN XD King Cab", "TITAN XD Single Cab", "Versa", "Versa Note"]
    var porscheModels = ["718 Boxster", "718 Cayman", "911", "Cayenne", "Macan", "Panamera"]
    var ramModels = ["1500 Classic Crew Cab", "1500 Classic Quad Cab", "1500 Classic Regular Cab", "1500 Crew Cab", "1500 Quad Cab", "1500 Regular Cab", "2500 Crew Cab", "2500 Mega Cab", "2500 Regular Cab", "3500 Crew Cab", "3500 Mega Cab", "3500 Regular Cab", "ProMaster Cargo Van", "ProMaster City", "ProMaster Window Van"]
    var rollsroyceModels = ["Dawn", "Ghost", "Phantom", "Wraith"]
    var smartModels = ["fortwo electric drive", "fortwo electric drive cabrio"]
    var subaruModels = ["Ascent", "BRZ", "Crosstrek", "Forester", "Impreza", "Legacy", "Outback", "WRX"]
    var testlaModels = ["Model 3", "Model S", "Model X", "Model Y", "Roadster"]
    var toyotaModels = ["4Runner", "86", "Avalon", "Avalon Hybrid", "Camry", "Camry Hybrid", "C-HR", "Corolla", "Corolla Hatchback", "Corolla iM", "Highlander", "Highlander Hybrid", "Land Cruiser", "Mirai", "Prius", "Prius c", "Prius Prime", "RAV4", "RAV4 Hybrid", "Sequoia", "Sienna", "Tacoma Access Cab", "Tacoma Double Cab", "Tundra CrewMax", "Tundra Double Cab", "Yaris", "Yaris iA"]
    var volkswagenModels = ["Atlas", "Beetle", "e-Golf", "Golf", "Golf Alltrack", "Golf GTI", "Golf R", "Golf SportWagen", "Jetta", "Passat", "Tiguan", "Tiguan Limited"]
    var volvoModels = ["S60", "S90", "V60", "V90", "XC40", "XC60", "XC90"]
    
    var colorsArr = ["Black","Blue","Brown","Gold","Green","Red","Silver", "White", "Yellow"]
    
    
    
    var statePicker = UIPickerView()
    var makePicker = UIPickerView()
    var modelPicker = UIPickerView()
    var colorsPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state.underlined()
        license.underlined()
        make.underlined()
        model.underlined()
        color.underlined()
        
        
        statePicker.delegate = self
        statePicker.dataSource = self
        state.inputView = statePicker
        
        makePicker.delegate = self
        makePicker.dataSource = self
        make.inputView = makePicker
        
        modelPicker.delegate = self
        modelPicker.dataSource = self
        model.inputView = modelPicker
        
        colorsPicker.delegate = self
        colorsPicker.dataSource = self
        color.inputView = colorsPicker
        
        license.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 7
        let currentString: NSString = license.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == statePicker){
            return statesArr.count
        }else if (pickerView == makePicker){
            return makeArr.count
        }else if (pickerView == modelPicker){
            if(make.text == "Acura"){
                return acuraModels.count
            }else if(make.text == "Alfa Romeo"){
                return alfaRomeoModels.count
            }else if(make.text == "Aston Martin"){
                return astonMartinModels.count
            }else if(make.text == "Audi"){
                return audiModels.count
            }else if(make.text == "Bentley"){
                return bentleyModels.count
            }else if(make.text == "BMW"){
                return bmwModels.count
            }else if(make.text == "Buick"){
                return buickModels.count
            }else if(make.text == "Cadillac"){
                return cadillacModels.count
            }else if(make.text == "Chevrolet"){
                return chevroletModels.count
            }else if(make.text == "Chrysler"){
                return chryslerModels.count
            }else if(make.text == "Dodge"){
                return dodgeModels.count
            }else if(make.text == "Ferrari"){
                return ferrariModels.count
            }else if(make.text == "FIAT"){
                return fiatModels.count
            }else if(make.text == "Ford"){
                return fordModels.count
            }else if(make.text == "Freightliner"){
                return freightlinerModels.count
            }else if(make.text == "Genesis"){
                return genesisModels.count
            }else if(make.text == "GMC"){
                return gmcModels.count
            }else if(make.text == "Honda"){
                return hondaModels.count
            }else if(make.text == "Hyundai"){
                return hyundaiModels.count
            }else if(make.text == "INFINITI"){
                return infinitiModels.count
            }else if(make.text == "Jaguar"){
                return jaguarModels.count
            }else if(make.text == "Jeep"){
                return jeepModels.count
            }else if(make.text == "Kia"){
                return kiaModels.count
            }else if(make.text == "Lamborghini"){
                return lamborghiniModels.count
            }else if(make.text == "Land Rover"){
                return landRoverModels.count
            }else if(make.text == "Lexus"){
                return lexusModels.count
            }else if(make.text == "Lincoln"){
                return lincolnModels.count
            }else if(make.text == "Lotus"){
                return lotusModels.count
            }else if(make.text == "Maserati"){
                return maseratiModels.count
            }else if(make.text == "MAZDA"){
                return mazdaModels.count
            }else if(make.text == "McLaren"){
                return mclarenModels.count
            }else if(make.text == "Mercedes-Benz"){
                return mercedesbenzModels.count
            }else if(make.text == "MINI"){
                return miniModels.count
            }else if(make.text == "Mitsubishi"){
                return mitsubishiModels.count
            }else if(make.text == "Nissan"){
                return nissanModels.count
            }else if(make.text == "Porsche"){
                return porscheModels.count
            }else if(make.text == "Ram"){
                return ramModels.count
            }else if(make.text == "Rolls-Royce"){
                return rollsroyceModels.count
            }else if(make.text == "smart"){
                return smartModels.count
            }else if(make.text == "Subaru"){
                return subaruModels.count
            }else if(make.text == "Tesla"){
                return testlaModels.count
            }else if(make.text == "Toyota"){
                return toyotaModels.count
            }else if(make.text == "Volkswagen"){
                return volkswagenModels.count
            }else if(make.text == "Volvo"){
                return volvoModels.count
            }
        }else if(pickerView == colorsPicker){
            return colorsArr.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == statePicker){
            state.text = statesArr[row]
        }else if (pickerView==makePicker){
            make.text = makeArr[row]
            if(make.text != ""){
                model.text = ""
                color.text = ""
                self.modelPicker.selectRow(0, inComponent: 0, animated: false)
                self.colorsPicker.selectRow(0, inComponent: 0, animated: false)
            }
        }else if (pickerView == modelPicker){
            if(make.text == "Acura"){
                model.text = acuraModels[row]
            }else if(make.text == "Alfa Romeo"){
                model.text = alfaRomeoModels[row]
            }else if(make.text == "Aston Martin"){
                model.text = astonMartinModels[row]
            }else if(make.text == "Audi"){
                model.text = audiModels[row]
            }else if(make.text == "Bentley"){
                model.text = bentleyModels[row]
            }else if(make.text == "BMW"){
                model.text = bmwModels[row]
            }else if(make.text == "Buick"){
                model.text = buickModels[row]
                
            }else if(make.text == "Cadillac"){
                model.text = cadillacModels[row]
                
            }else if(make.text == "Chevrolet"){
                model.text = chevroletModels[row]
                
            }else if(make.text == "Chrysler"){
                model.text = chryslerModels[row]
                
            }else if(make.text == "Dodge"){
                model.text = dodgeModels[row]
                
            }else if(make.text == "Ferrari"){
                model.text = ferrariModels[row]
                
            }else if(make.text == "FIAT"){
                model.text = fiatModels[row]
                
            }else if(make.text == "Ford"){
                model.text = fordModels[row]
                
            }else if(make.text == "Freightliner"){
                model.text = freightlinerModels[row]
                
            }else if(make.text == "Genesis"){
                model.text = genesisModels[row]
                
            }else if(make.text == "GMC"){
                model.text = gmcModels[row]
                
            }else if(make.text == "Honda"){
                model.text = hondaModels[row]
                
            }else if(make.text == "Hyundai"){
                model.text = hyundaiModels[row]
                
            }else if(make.text == "INFINITI"){
                model.text = infinitiModels[row]
                
            }else if(make.text == "Jaguar"){
                model.text = jaguarModels[row]
                
            }else if(make.text == "Jeep"){
                model.text = jeepModels[row]
                
            }else if(make.text == "Kia"){
                model.text = kiaModels[row]
                
            }else if(make.text == "Lamborghini"){
                model.text = lamborghiniModels[row]
                
            }else if(make.text == "Land Rover"){
                model.text = landRoverModels[row]
                
            }else if(make.text == "Lexus"){
                model.text = lexusModels[row]
                
            }else if(make.text == "Lincoln"){
                model.text = lincolnModels[row]
                
            }else if(make.text == "Lotus"){
                model.text = lotusModels[row]
                
            }else if(make.text == "Maserati"){
                model.text = maseratiModels[row]
                
            }else if(make.text == "MAZDA"){
                model.text = mazdaModels[row]
                
            }else if(make.text == "McLaren"){
                model.text = mclarenModels[row]
                
            }else if(make.text == "Mercedes-Benz"){
                model.text = mercedesbenzModels[row]
                
            }else if(make.text == "MINI"){
                model.text = miniModels[row]
                
            }else if(make.text == "Mitsubishi"){
                model.text = mitsubishiModels[row]
                
            }else if(make.text == "Nissan"){
                model.text = nissanModels[row]
                
            }else if(make.text == "Porsche"){
                model.text = porscheModels[row]
                
            }else if(make.text == "Ram"){
                model.text = ramModels[row]
                
            }else if(make.text == "Rolls-Royce"){
                model.text = rollsroyceModels[row]
                
            }else if(make.text == "smart"){
                model.text = smartModels[row]
                
            }else if(make.text == "Subaru"){
                model.text = subaruModels[row]
                
            }else if(make.text == "Tesla"){
                model.text = testlaModels[row]
                
            }else if(make.text == "Toyota"){
                model.text = toyotaModels[row]
                
            }else if(make.text == "Volkswagen"){
                model.text = volkswagenModels[row]
                
            }else if(make.text == "Volvo"){
                model.text = volvoModels[row]
                
            }
        }else if(pickerView == colorsPicker){
            color.text = colorsArr[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == statePicker){
            return statesArr[row]
        }else if (pickerView == makePicker){
            return makeArr[row]
        }else if (pickerView == modelPicker){
            if(make.text == "Acura"){
                return acuraModels[row]
            }else if(make.text == "Alfa Romeo"){
                return alfaRomeoModels[row]
            }else if(make.text == "Aston Martin"){
                return astonMartinModels[row]
            }else if(make.text == "Audi"){
                return  audiModels[row]
            }else if(make.text == "Bentley"){
                return bentleyModels[row]
            }else if(make.text == "BMW"){
                return bmwModels[row]
            }else if(make.text == "Buick"){
                return buickModels[row]
                
            }else if(make.text == "Cadillac"){
                return cadillacModels[row]
                
            }else if(make.text == "Chevrolet"){
                return chevroletModels[row]
                
            }else if(make.text == "Chrysler"){
                return chryslerModels[row]
                
            }else if(make.text == "Dodge"){
                return dodgeModels[row]
                
            }else if(make.text == "Ferrari"){
                return ferrariModels[row]
                
            }else if(make.text == "FIAT"){
                return fiatModels[row]
                
            }else if(make.text == "Ford"){
                return fordModels[row]
                
            }else if(make.text == "Freightliner"){
                return freightlinerModels[row]
                
            }else if(make.text == "Genesis"){
                return genesisModels[row]
                
            }else if(make.text == "GMC"){
                return gmcModels[row]
                
            }else if(make.text == "Honda"){
                return hondaModels[row]
                
            }else if(make.text == "Hyundai"){
                return hyundaiModels[row]
                
            }else if(make.text == "INFINITI"){
                return infinitiModels[row]
                
            }else if(make.text == "Jaguar"){
                return jaguarModels[row]
                
            }else if(make.text == "Jeep"){
                return jeepModels[row]
                
            }else if(make.text == "Kia"){
                return kiaModels[row]
                
            }else if(make.text == "Lamborghini"){
                return lamborghiniModels[row]
                
            }else if(make.text == "Land Rover"){
                return landRoverModels[row]
                
            }else if(make.text == "Lexus"){
                return lexusModels[row]
                
            }else if(make.text == "Lincoln"){
                return lincolnModels[row]
                
            }else if(make.text == "Lotus"){
                return lotusModels[row]
                
            }else if(make.text == "Maserati"){
                return maseratiModels[row]
                
            }else if(make.text == "MAZDA"){
                return mazdaModels[row]
                
            }else if(make.text == "McLaren"){
                return mclarenModels[row]
                
            }else if(make.text == "Mercedes-Benz"){
                return mercedesbenzModels[row]
                
            }else if(make.text == "MINI"){
                return miniModels[row]
                
            }else if(make.text == "Mitsubishi"){
                return mitsubishiModels[row]
                
            }else if(make.text == "Nissan"){
                return nissanModels[row]
                
            }else if(make.text == "Porsche"){
                return porscheModels[row]
                
            }else if(make.text == "Ram"){
                return ramModels[row]
                
            }else if(make.text == "Rolls-Royce"){
                return rollsroyceModels[row]
                
            }else if(make.text == "smart"){
                return smartModels[row]
                
            }else if(make.text == "Subaru"){
                return subaruModels[row]
                
            }else if(make.text == "Tesla"){
                return testlaModels[row]
                
            }else if(make.text == "Toyota"){
                return toyotaModels[row]
                
            }else if(make.text == "Volkswagen"){
                return volkswagenModels[row]
                
            }else if(make.text == "Volvo"){
                return volvoModels[row]
                
            }
        }else if(pickerView == colorsPicker){
            return colorsArr[row]
        }
        return ""
    }
    
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser
    
    @IBAction func skipClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "UITabBarController")
        self.present(controller, animated: true, completion: nil)
        
        db.collection("Users").document((currentUser?.uid)!).setData([
            "phoneNumber": currentUser?.phoneNumber!,
            "fullName": fullName,
            "email": email,
            "dateOfBirth": dateOfBirth,
            "carState": nil,
            "carLicense": nil,
            "carMake": nil,
            "carModel": nil,
            "carColor": nil
            ])
    }
    
    @IBAction func finishClicked(_ sender: UIButton) {
        var check = false
        if(state.text=="" || make.text=="" || model.text=="" || color.text==""){
            let alertController = UIAlertController(title: "OpenSpot", message: "please fill out all information", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }else if((state.text != "" || make.text != "" || model.text != "" || color.text != "")&&((license.text?.count)!<=2)){
            let alertController1 = UIAlertController(title: "OpenSpot", message: "please enter a valid license plate number", preferredStyle: UIAlertController.Style.alert)
            alertController1.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController1, animated: true, completion: nil)
        }else{
            check=true
        }
        
        if check == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "UITabBarController")
            self.present(controller, animated: true, completion: nil)
            
            db.collection("Users").document((currentUser?.uid)!).setData([
                "phoneNumber": currentUser?.phoneNumber!,
                "fullName": fullName,
                "email": email,
                "dateOfBirth": dateOfBirth,
                "carState": state.text!,
                "carLicense": license.text!,
                "carMake": make.text!,
                "carModel": model.text!,
                "carColor": color.text!
                ])
        }
        
    }
    
}
