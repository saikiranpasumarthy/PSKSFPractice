import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {

    selected = {} // for storing answers
    correctAnswers = 0 //to show number of correct answers
    isSubmitted = false //to show the result

    myQuestions = [
        {
            id: "Question1",
            question:"Which one of the following is not a template Loop?",
            answers: {
                a:"for:each",
                b:"iterator",
                c:"map loop"
            },
            correctAnswer: "c"
        },
        {
            id:"Question2",
            question:"Which of the file is invald in LWC component folder?",
            answers:{
                a:".svg",
                b:".apex",
                c:".js"
            },
            correctAnswer:"b"
        },
        {
            id:"Question3",
            question:"WHich one of the following is not a directive?",
            answers:{
                a:"for:each",
                b:"if:true",
                c:"@track"
            },
            correctAnswer:"c"
        }
    ]

    get allNotSelected() {
        return !(Object.keys(this.selected).length === this.myQuestions.length)
    }

    get isScoredFull()
    {
        return `slds-text-heading_large ${this.myQuestions.length === this.correctAnswers? 'slds-text-color_success':'slds-text-color_error'}`
    }

    changeHandler(event){
        console.log(event.target.value);
        console.log('sel before ', this.selected)
        const {name, value} = event.target
        this.selected = {...this.selected, [name]:value};
        console.log('sel after ', this.selected)
    }

    handleClick(event){
        event.preventDefault();
        let correct = this.myQuestions.filter(item=>this.selected[item.id] === item.correctAnswer)
        this.correctAnswers = correct.length;
        this.isSubmitted = true   
    }

    resetHandler(event){
        this.selected = {};
        this.correctAnswers = 0;
        this.isSubmitted = false
    }

}