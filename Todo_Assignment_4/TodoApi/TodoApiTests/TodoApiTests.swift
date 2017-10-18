//
//  TodoApiTests.swift
//  TodoApiTests
//
//  Created by Sheets on 4/19/17.
//  Copyright © 2017 Sheets. All rights reserved.
//

import XCTest
@testable import TodoApi

class TodoApiTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        TodoApi.todoService = TodoHTTPService(host: "http://cscc-todos.getsandbox.com")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        TodoApi.todoService = nil
    }

    func testGetTodos() {
        let expect = expectation(description: "Index")

        try! TodoApi.getTodos { (completion: HandlerTodos) in
            do {
                let todos = try completion()

                print(todos)
                XCTAssertNotNil(todos)
                
                expect.fulfill()
            } catch  {
                print("Error info: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail((error?.localizedDescription)!)
            }
        }
    }
    
    func testCreateTodo() {
        let expect = expectation(description: "Create")
        
        let todo = TodoModel()
        todo.title = "Complete Assignment 4"
        todo.body = "Assignment 4 is due May 10"
        todo.priority = 2
        todo.done = false
        
        try! TodoApi.createTodo(todo: todo) { (completion: HandlerTodo) in
            do {
                let todo = try completion()
                
                print(todo!)
                XCTAssertNotNil(todo)
                
                expect.fulfill()
            } catch  {
                print("Error info: \(error)")
            }
        }
        
        waitForExpectations(timeout: 10.0) { (error) in
            if error != nil {
                XCTFail((error?.localizedDescription)!)
            }
        }
    }
    
    func testGetTodo() {
        let expect = expectation(description: "Get")
        
        try! TodoApi.getTodo(id: "dbfb9fb6-09c0-4035-d486-3287a6ad0a54") { (completion: HandlerTodo) in
            do {
                let todo = try completion()
                
                print(todo!)
                XCTAssertNotNil(todo)
                
                expect.fulfill()
            } catch  {
                print("Error info: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail((error?.localizedDescription)!)
            }
        }
    }
    
    func testUpdateTodo() {
        let expect = expectation(description: "Update")

        try! TodoApi.getTodo(id: "dbfb9fb6-09c0-4035-d486-3287a6ad0a54") { (completion: HandlerTodo) in
            do {
                let todo = try completion()

                todo!.done = false

                try! TodoApi.updateTodo(todo: todo!) { (completion: HandlerVoid) in
                    do {
                        try completion()
                        
                        expect.fulfill()
                    } catch  {
                        print("Error info: \(error)")
                    }
                }
            } catch  {
                print("Error info: \(error)")
            }
        }

        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail((error?.localizedDescription)!)
            }
        }
    }
    
    func testDeleteTodo() {
        let expect = expectation(description: "Delete")
        
        try! TodoApi.deleteTodo(id: "dbfb9fb6-09c0-4035-d486-3287a6ad0a54") { (completion: HandlerVoid) in
            do {
                try completion()
                
                expect.fulfill()
            } catch  {
                print("Error info: \(error)")
            }
        }
        
        waitForExpectations(timeout: 5.0) { (error) in
            if error != nil {
                XCTFail((error?.localizedDescription)!)
            }
        }
    }
    
}
