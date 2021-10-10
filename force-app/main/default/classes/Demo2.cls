public class Demo2 {
    
    public String helloWorldString;										//Instance Member variables
    
    private static final String defaultString;							//declaring a static constant variable
    
    
    
    static{																//This is a static block. This runs only once when a class is loaded.
        defaultString = 'This is a static string variable value.';
    }
    
    
    public Demo2()														//This is a constructor
    {
        this (defaultString);
    }
    
      
    public Demo2(String stringToDisplay)								//Overloaded Contructor
    {
        this.helloWorldString = stringToDisplay;
    }
    
    
    public void printOutput()											//Method
    {
        system.debug('Display text : ' + helloWorldString);
    }
    
    public static void printOutput1()									//Static Method
    {
        system.debug('Display text from the static method');
    }

}