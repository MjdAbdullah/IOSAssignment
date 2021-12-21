//
//  AddItemDelegate.swift
//  ToDoApp
//
//  Created by admin on 21/12/2021.
//

import Foundation

protocol AddItemDelegate: class{
    func itemSaved(by controller: AddTableViewController, titel: String, description: String, date: Date, done: Bool)
    func cancelButtonPressed(by controller: AddTableViewController)
}
