//
//  ToDoModel.swift
//  MeetPoint
//
//  Created by Alisher Zinullayev on 21.07.2023.
//

import Foundation

struct ToDoModel: Codable {
    let name: String
    let date: Date
    let taskDescription: String
    let address: String
}
