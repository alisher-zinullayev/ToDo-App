//
//  DatabaseManager.swift
//  MeetPoint
//
//  Created by Alisher Zinullayev on 21.07.2023.
//

import Foundation

protocol DatabaseManagerProtocol {
    
    func addToDo(_ todo: ToDoModel)
    func getToDoList() -> [ToDoModel]
}

final class DatabaseManagerUserDefault: DatabaseManagerProtocol {
    
    private let todosKey = "ToDosKey"
    let defaults = UserDefaults.standard
    
    func addToDo(_ todo: ToDoModel) {
        var toDoArray = getToDoList()
        toDoArray.append(todo)
        saveToDoList(toDoArray)
    }
    
    func getToDoList() -> [ToDoModel] {
        if let data = UserDefaults.standard.data(forKey: todosKey) {
            do {
                let todos = try JSONDecoder().decode([ToDoModel].self, from: data)
                return todos
            } catch {
                print("Error decoding todos: \(error)")
            }
        }
        return []
    }
    
    private func saveToDoList(_ todo: [ToDoModel]) {
        do {
            let data = try JSONEncoder().encode(todo)
            UserDefaults.standard.set(data, forKey: todosKey)
        } catch {
            print("Error encoding todos: \(error)")
        }
    }
    
}
