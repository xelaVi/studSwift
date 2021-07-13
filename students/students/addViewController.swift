//
//  addViewController.swift
//  students
//
//  Created by Александр Иванов on 08.07.2021.
//

import UIKit

struct keyDefaults {
    static let keyName = "name"
    static let keySurname = "surname"
    static let keyRate = "rate"
}

class addViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    
    var showName = ""
    var showSurname = ""
    var showRate = ""
    var indexBase = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = showName
        surnameTextField.text = showSurname
        rateTextField.text = showRate
        
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let name = nameTextField.text!
        let surname = surnameTextField.text!
        let rate = rateTextField.text!
        
        let digits = Int(rate) ?? 0

       
       if name.isEmpty || surname.isEmpty || rate.isEmpty{
            let nilAlert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            nilAlert.addAction(okBtn)
            present(nilAlert, animated: true, completion: nil)
        
        
       }else if name.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil{
            
            let nameAlert = UIAlertController(title: "Ошибка", message: "Поле 'Имя' должно содержать только русские и английские символы, без пробелов", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            nameAlert.addAction(okBtn)
            present(nameAlert, animated: true, completion: nil)
            
            
        }else if surname.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil{
            
            let surnameAlert = UIAlertController(title: "Ошибка", message: "Поле 'Фамилия' должно содержать только русские и английские символы, без пробелов", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            surnameAlert.addAction(okBtn)
            present(surnameAlert, animated: true, completion: nil)

            
        }else if rate.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) != nil || digits < 1 || digits > 5{
            
            let rateAlert = UIAlertController(title: "Ошибка", message: "Поле 'Средний балл' должно содержать только целое число от 1 до 5, без пробелов", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            rateAlert.addAction(okBtn)
            present(rateAlert, animated: true, completion: nil)
            
            
        }else {
            
            if !showName.isEmpty && !showSurname.isEmpty && !showRate.isEmpty{
                Base.shared.rating[indexBase].name = name
                Base.shared.rating[indexBase].surname = surname
                Base.shared.rating[indexBase].rate = rate
            }else{
                Base.shared.saveRating(name: name, surname: surname, rate: rate)
            }
            
            self.navigationController?.popViewController(animated: true)
        }
        
        
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
