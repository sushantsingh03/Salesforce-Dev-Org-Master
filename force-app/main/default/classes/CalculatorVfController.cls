public class CalculatorVfController {
    
    public Integer num1 {get; set;}
    public Integer num2 {get; set;}
    public Integer num3 {get; set;}
    
    public void add()
    {
        num3 = num1 + num2;
    }
    
    public void substract()
    {
        if (num1 > num2)
        {
         num3 = num1 -num2;   
        }
        
        else
        {
            num3 = num2 - num1;
        }
        
    }
    
    public void divide()
    {
        if (num1 > num2)
        {
         num3 = num1/num2;   
        }
        
        else
        {
            num3 = num2/num1;
        }
        
    }
    
    public void multiply()
    {
        num3 = num1 * num2;
    }

}