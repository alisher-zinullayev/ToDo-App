//
//  ViewController.swift
//  MeetPoint
//
//  Created by Alisher Zinullayev on 17.07.2023.
//

import UIKit

final class AddViewController: UIViewController {
    
    private let dataBaseManager: DatabaseManagerProtocol = DatabaseManagerUserDefault()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [.font: UIFont.systemFont(ofSize: 12)])
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let addressTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Address", attributes: [.font: UIFont.systemFont(ofSize: 12)])
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [.font: UIFont.systemFont(ofSize: 12)])
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        datePicker.timeZone = .current
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .systemBackground
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        view.backgroundColor = .systemBackground
    }
    
    private func setupUI() {
        addSubviews()
        setupButtons()
        configureConstraints()
    }

    private func setupButtons() {
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
    }
    
    private func addSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(addressTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
    }
    
    private func configureConstraints() {
        let nameTextFieldConstraints = [
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 200),
            nameTextField.heightAnchor.constraint(equalToConstant: 25)
        ]
        let addressTextFieldConstraints = [
            addressTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 25),
            addressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressTextField.widthAnchor.constraint(equalToConstant: 200),
            addressTextField.heightAnchor.constraint(equalToConstant: 25)
        ]
        let descriptionTextFieldConstraints = [
            descriptionTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 25),
            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextField.widthAnchor.constraint(equalToConstant: 200),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 25)
        ]
        let dateLabelConstraints = [
            dateLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 50),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        let datePickerConstraints = [
            datePicker.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        let cancelButtonConstraints = [
            cancelButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -60)
        ]
        let saveButtonConstraints = [
            saveButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 30),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 60)
        ]
        NSLayoutConstraint.activate(nameTextFieldConstraints)
        NSLayoutConstraint.activate(addressTextFieldConstraints)
        NSLayoutConstraint.activate(descriptionTextFieldConstraints)
        NSLayoutConstraint.activate(dateLabelConstraints)
        NSLayoutConstraint.activate(datePickerConstraints)
        NSLayoutConstraint.activate(cancelButtonConstraints)
        NSLayoutConstraint.activate(saveButtonConstraints)
        
//        NSLayoutConstraint.activate([nameTextFieldConstraints, addressTextFieldConstraints, descriptionTextFieldConstraints, dateLabelConstraints, datePickerConstraints, cancelButtonConstraints, saveButtonConstraints])
        
    }
    
    @objc private func saveButtonPressed() {
        
        guard let name = nameTextField.text else {
            let name = ""
            return
        }
            
        guard let taskDescription = descriptionTextField.text else {
            let taskDescription = ""
            return
        }
        
        guard let address = addressTextField.text else {
            let address = ""
            return
        }
        
        let date = datePicker.date
        
        let toDoItem = ToDoModel(name: name, date: date, taskDescription: taskDescription, address: address)
        dataBaseManager.addToDo(toDoItem)
        
        previousViewController()
    }
    
    @objc private func cancelButtonPressed() {
        previousViewController()
    }
    
    private func previousViewController() {
        if let navigationController = navigationController {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: true)
            } else {
                print("no previous view controller")
            }
        } else {
            print("nil")
        }
    }
    
}
