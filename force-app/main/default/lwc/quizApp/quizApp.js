import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {

 //for storing answers
 selected = {}

 isSubmitted = false

correctAnswers = 0

myQuestions = [
    
    {   
        id: "Question1",
        question: "Who amongst the following had NOT been the Richest Man in the world, yet?",
        answers : { a: "Mukesh Ambani", b: "Warren Buffet", c: "Elon Musk", d: "Jeff Bezos" },
        correctAnswer : "a"
    },

    {   
        id: "Question2",
        question: "Which scripting language supports ECMA Script 15 aka ES15 framework?",
        answers : { a: "Javascript", b: "Angular JS", c: "None of the above", d: "Both of the above" },
        correctAnswer : "d"
    },

    {   
        id: "Question3",
        question: "Which cricketer recently took a wicket of the first ball of a test inning, making this to happen after 112 years in Internation cricket?",
        answers : { a: "Axar Patel", b: "R Ashwyn", c: "Dom Bess", d: "Joe Root" },
        correctAnswer : "b"
    }


            ]

//used for disabling submit button
get allNotSelected()
{
    return !(Object.keys(this.selected).length === this.myQuestions.length)
}

//for applying dyanamic styling to our result
get isScoredFull()
{
    return `slds-text-heading_large ${this.myQuestions.length === this.correctAnswers?'slds-text-color_success':'slds-text-color_error'}`
}


//change handler called on every click
changeHandler(event)
{
    // console.log("Name : ",event.target.name)
    // console.log("Value : ",event.target.value)
    const{name,value} = event.target //object destructuring
    
    this.selected = {...this.selected, [name]:value} 

}

//form submit handler
submitHandler(event)
{
    event.preventDefault() //to stop refreshing of page

    //this.selected = {"Question1":"a","Question2":"b","Question3":"c"}
    let correct= this.myQuestions.filter(item=>this.selected[item.id] === item.correctAnswer)
    console.log(correct)
    this.correctAnswers= correct.length
    this.isSubmitted= true
    console.log(this.correctAnswers)
    
}

//form reset handler
resetHandler()
{
    this.selected = {}
    this.correctAnswers = 0
    this.isSubmitted = false
}


}