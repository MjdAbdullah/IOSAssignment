//
//  AddTaskDelegate.swift
//  ToDoApp
//
//  Created by admin on 28/12/2021.
//

import Foundation

protocol AddTaskDelegate: class{
    func itemSaved(title: String, description: String, date: Date, done: Bool)
}
