//
//  ViewController.swift
//  cacu
//
//  Created by s20171103196 on 2018/10/27.
//  Copyright © 2018 s20171103196. All rights reserved.
//

import UIKit
class Stack <T>{
    var top:Int = -1
    var flag:Int = 0
    var num = [T]()
    
    public func IsEmpty()->Int
    {
        if top == -1{
            return 1
        }
        else if top > -1{
            return 0;
        }
        return -1
    }
    public func PushStack(x:T)->Int{
        num.append(x)
        top=top+1
        return 1
    }
    public func PopStack()->T?{
        let f=num.removeLast()
        top=top-1
        return f
    }
    public func inspectTop()->T?{
        if(top == -1){
            return nil;
        }
        else{
            return num[top]
        }
    }
    public func GetTop()->Int{
        return top
    }
};

class calculate {
    var flag = 0
    var y1 = Stack<Double>()
    var z1 = Stack<String>()
    public init() {}
    public func judge(x:String)->Int
    {
        if x == "="
        {
            flag = -9
        }
        if x == "×"
        {
            flag = 4
        }
        if x == "÷"
        {
            flag = 4
        }
        if x == "+"
        {
            flag = 2
        }
        if x == "-"
        {
            flag = 2
        }
        if x == "("
        {
            flag = -5
        }
        if x == ")"
        {
            flag = -7
        }
        return flag
    }
    public func sum()->Double
    {
        var e:String = "0"
        var a:Double = 0
        var b:Double = 0
        while(z1.IsEmpty() != 1)
        {
            e = z1.PopStack()!
            if e == "+"
            {
                a = y1.PopStack()!
                b = y1.PopStack()!
                y1.PushStack(x: a + b)
            }
            if e == "-"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a - b)
            }
            if e == "×"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a * b)
            }
            if e == "÷"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a / b)
            }
            
        }
        return y1.PopStack()!;
    }
    public func op1(x1:String,y1:Stack<Double>,z1:Stack<String>)
    {
        var e:String = "0"
        var a:Double = 0
        var b:Double = 0
        while(z1.IsEmpty() != 1&&judge(x: x1) < judge(x:z1.inspect()!)+1&&z1.IsEmpty() != 1)
        {
            e = z1.PopStack()!;
            if e == "+"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a + b)
            }
            if e == "-"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: b - a)
            }
            if e == "×"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a * b)
            }
            if e == "÷"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: b / a)
            }
            if e == "("
            {
                break
            }
        }
        
    }
    
};

class ViewController: UIViewController {
    var stack1 = Stack<Double>()
    var stack2 = Stack<String>()
    var temp:Double=0
    var temp1:Double=1
    var operatorFlag:Int=0
    var port:Double=0
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var result2: UITextField!
    @IBAction func b1(_ sender: Any) {
        result.text = result.text!+"1"
        result2.text = result.text!+"1"
    }
    @IBAction func b2(_ sender: Any) {
        result.text = result.text!+"2"
        result2.text = result.text!+"2"
    }
    
    @IBAction func b3(_ sender: Any) {
        result.text = result.text!+"3"
        result2.text = result.text!+"3"
    }
    @IBAction func b4(_ sender: Any) {
        result.text = result.text!+"4"
        result2.text = result.text!+"4"
    }
    @IBAction func b5(_ sender: Any) {
        result.text = result.text!+"5"
        result2.text = result.text!+"5"
    }
    @IBAction func b6(_ sender: Any) {
        result.text = result.text!+"6"
        result2.text = result.text!+"6"
    }
    @IBAction func b7(_ sender: Any) {
        result.text = result.text!+"7"
       result2.text = result.text!+"7"
    }
    @IBAction func b8(_ sender: Any) {
        result.text = result.text!+"8"
        result2.text = result.text!+"8"
    }
    @IBAction func b9(_ sender: Any) {
        result.text = result.text!+"9"
        result2.text = result.text!+"9"
    }
    @IBAction func b0(_ sender: Any) {
        result.text = result.text!+"0"
        result2.text = result.text!+"0"
    }
    @IBAction func Left(_ sender: Any) {
        stack2.PushStack(x: "(")
        result.text = result.text! + "("
    }
    @IBAction func point(_ sender: Any) {
        stack1.PushStack(x: Double(result2.text!)!)
        result2.text = ""
        op.op1(x1: ")", y1: stat, z1: stack2)
        
        result.text = result.text! + ")"
    }
    @IBAction func add(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "+")
        }
        else
        {
            op.op1(x1: "+", y1: stat, z1: stat)
            stack2.PushStack(x: "+")
        }
        
        
        result.text = result.text! + "+"
    }
    @IBAction func AC(_ sender: Any) {
        result.text = ""
        result2.text = ""
    }
    @IBAction func sub(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "-")
        }
        else
        {
            op.op1(x1: "-", y1: stat, z1: stat)
            stack2.PushStack(x: "-")
        }
        
        
        result.text = result.text! + "-"
    }
    @IBAction func mut(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "*")
        }
        else
        {
            op.op1(x1: "*", y1: stat, z1: st2)
            stack2.PushStack(x: "*")
        }
        
        
        result.text = result.text! + "*"
    }
    @IBAction func chu(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "/")
        }
        else
        {
            op.op1(x1: "/", y1: stat, z1: stat)
            stack2.PushStack(x: "/")
        }
        
        
        result.text = result.text! + "/"
    }
    
    @IBAction func buttonResult(_ sender: Any) {
        if operatorFlag == 1
        {
            temp = temp + port
            result.text="\(temp)"
            port = temp
            temp = 0
            
        }
        if operatorFlag == 2
        {
            temp1 = temp1 - port
            result.text="\(temp1)"
            port = temp1
            temp1 = 0
        }
        if operatorFlag == 3
        {
            temp1 = temp1 * port
            result.text="\(temp1)"
            temp1 = 1
            port = temp1
            temp1 = 0
        }
        if operatorFlag == 4
        {
            temp1 = temp1 / port
            result.text="\(temp1)"
            port = temp1
            temp1 = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

