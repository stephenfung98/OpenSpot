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
    
    var acuraModels = ["acuraModel1","acuraModel2"]
    var alfaRomeoModels = ["alfaRomeoModels1","alfaRomeoModels2"]
    var astonMartinModels = ["AstonMartin1","AstonMartin2"]
    var audiModels = ["Audi1","Audi2"]
    var bentleyModels = ["bentleymode1","bentleymode2"]
    var bmwModels = ["bmw1","bmw2"]
    var buickModels = ["buickModels1","buickModels2"]
    var cadillacModels = ["cadillacModels1","cadillacModels2"]
    var chevroletModels = ["chevroletModels1","chevroletModels2"]
    var chryslerModels = ["chryslerModels1","chryslerModels2"]
    var dodgeModels = ["dodgeModels1","dodgeModels2"]
    var ferrariModels = ["ferrariModels1","ferrariModels2"]
    var fiatModels = ["fiatModels1","fiatModels2"]
    var fordModels = ["fordModels1","fordModels2"]
    var freightlinerModels = ["freightlinerModels1","freightlinerModels2"]
    var genesisModels = ["genesisModels1","genesisModels2"]
    var gmcModels = ["gmcModels1","gmcModels2"]
    var hondaModels = ["hondaModels1","hondaModels2"]
    var hyundaiModels = ["hyundaiModels1","hyundaiModels2"]
    var infinitiModels = ["infinitiModels1","infinitiModels2"]
    var jaguarModels = ["jaguarModels1","jaguarModels2"]
    var jeepModels = ["jeepModels1","jeepModels2"]
    var kiaModels = ["kiaModels1","kiaModels2"]
    var lamborghiniModels = ["lamborghiniModels1","lamborghiniModels2"]
    var landRoverModels = ["landRoverModels1","landRoverModels2"]
    var lexusModels = ["lexusModels1","lexusModels2"]
    var lincolnModels = ["lincolnModels1","lincolnModels2"]
    var lotusModels = ["lotusModels1","lotusModels2"]
    var maseratiModels = ["maseratiModels1","maseratiModels2"]
    var mazdaModels = ["mazdaModels1","mazdaModels2"]
    var mclarenModels = ["mclarenModels1","mclarenModels2"]
    var mercedesbenzModels = ["mercedesbenzModels1","mercedesbenzModels2"]
    var miniModels = ["miniModels1","miniModels2"]
    var mitsubishiModels = ["mitsubishiModels1","mitsubishiModels2"]
    var nissanModels = ["nissanModels1","nissanModels2"]
    var porscheModels = ["porscheModels1","porscheModels2"]
    var ramModels = ["ramModels1","ramModels2"]
    var rollsroyceModels = ["rollsroyceModels1","rollsroyceModels2"]
    var smartModels = ["smartModels1","smartModels2"]
    var subaruModels = ["subaruModels1","subaruModels"]
    var testlaModels = ["testlaModels1","testlaModels2"]
    var toyotaModels = ["toyotaModels1","toyotaModels2"]
    var volkswagenModels = ["volkswagenModels1","volkswagenModels2"]
    var volvoModels = ["volvoModels1","volvoModels2"]
    
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
        
        if(check==true){
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

extension UITextField {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.5)
        let pink = UIColor(red: 231/255, green: 117/255, blue: 157/255, alpha: 1.0)
        border.borderColor = pink.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height + 0.6 - width , width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
