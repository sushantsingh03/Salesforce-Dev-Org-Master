public class HtmlStringWriter extends StringWriter {
    
    public override void printString()
    {
        system.debug('<p> This is a Html string </p>');
    }

}