import { LightningElement, track, api } from 'lwc';

export default class DemoCalculator extends LightningElement
{
    @track number1;
    @track number2;
    @track result;

    handleChangeOnNumber1(event)
    {
            this.number1 = event.target.value;
    }

    
    handleChangeOnNumber2(event)
    {
        this.number2 = event.target.value;
    }

    add(event)
    {
        /*var inp=this.template.querySelectorAll("lightning-input");

         inp.forEach(function(element){
            if(element.name=="firstNumber")
                this.number1=element.value;

            else if(element.name=="secondNumber")
                this.number2=element.value;
        },this);
        
        this.result = number1+number2;*/
        let num1 = this.number1;
        console.log(num1);
        let num2 = this.number2;
        console.log(num2);
        if(num1 < 0)
        {
            num1.reportValidity();
        }
        else if (num2 < 0)
            {
                num2.reportValidity();
            }
        else
        {
            this.result = parseInt(this.number1) + parseInt(this.number2);
        }

        //this.result = parseInt(this.number1) + parseInt(this.number2);
        
    }

    substract(event)
    {
        if (this.number1 > this.number2)
        {
        this.result = parseInt(this.number1) - parseInt(this.number2);
        }
        else
        {
        this.result = parseInt(this.number2) - parseInt(this.number1);
        }
        
    }

    multiply(event)
    {

        this.result = parseInt(this.number1) * parseInt(this.number2);
    
    }

    divide(event)

    {
        this.result = parseInt(this.number1)/parseInt(this.number2)
    }


}