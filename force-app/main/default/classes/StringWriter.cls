public virtual class StringWriter {
    
    @TestVisible
    private Integer testInt; // creating this variable and assigning value to it inside the class so that we can use the same in the test class to test the method
    
    public virtual void printString() {
        
        System.debug('This is a String');
        testInt = 2;
    }

}