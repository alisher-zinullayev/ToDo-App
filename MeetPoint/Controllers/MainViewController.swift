//
//  DateTableViewController.swift
//  MeetPoint
//
//  Created by Alisher Zinullayev on 17.07.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let dataBaseManager: DatabaseManagerProtocol = DatabaseManagerUserDefault()
    
    private var toDoItems: [ToDoModel] = []
    
    private lazy var addButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        return button
    }()
    
    private let dateTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MeetingTableViewCell.self, forCellReuseIdentifier: MeetingTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem =  addButton
        view.addSubview(dateTableView)
        dateTableView.delegate = self
        dateTableView.dataSource = self
        dateTableView.frame = view.bounds
        displayToDoItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayToDoItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc private func addButtonTapped() {
        if let navigationController = navigationController {
            let mainVC = AddViewController()
            navigationController.pushViewController(mainVC, animated: true)
        } else {
            print("nil")
        }
    }
    
    private func displayToDoItems() {
        toDoItems = dataBaseManager.getToDoList()
        dateTableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeetingTableViewCell.identifier, for: indexPath) as? MeetingTableViewCell else {return UITableViewCell()}
        let todo = toDoItems[indexPath.row]
        cell.nameLabel.text = todo.name
        cell.addressLabel.text = todo.address
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        cell.descriptionLabel.text = dateFormatter.string(from: todo.date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
