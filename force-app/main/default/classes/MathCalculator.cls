public class MathCalculator {
    
    private static Integer add (Integer a1, Integer a2)
        
    {
        //Integer sum = 0;
        //sum = a1+a2;  
        //system.debug('The sum of the two numbers is : ' +sum);
        return a1+a2;
        
    }
    
    private static Integer multiply (Integer b1, Integer b2)
    {
        //Integer product;
        //product = b1*b2;
        //system.debug('The product of the two numbers is : ' +product);
        return b1* b2;
    }

    private static Integer substract (Integer num1, Integer num2)
    {
        if (num1 > num2)
        {
        return num1 - num2;
        }
        else {
            return num2 - num1;
        }
    }
    
    private static void printOutput (Integer d1, Integer d2)
    {
        system.debug('The sum of the two numbers ' + d1 + ' and ' + d2 + ' is : ' +add(d1,d2) );
        system.debug('The product of the two numbers ' + d1 + ' and ' + d2 + ' is : ' +multiply(d1,d2) );
        system.debug('The difference between the two numbers ' + d1 + ' and ' + d2 + ' is : ' +substract(d1,d2));
    }
    
    public void doMath (Integer c1, Integer c2)
    {
        printOutput(c1,c2);
    }

}