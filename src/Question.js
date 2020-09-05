import React, { Component } from 'react';
import logo from './logo.svg';
import './Question.css';
import axios from 'axios';
import ReactGA from 'react-ga';

class Question extends Component {
  constructor(props) {
    super(props);

    this.state = {
      questions: this.props.list,
      currQuestion: this.props.list[0].content,
      currAnswers: this.props.list[0].answers,
      index: 0,
      responses: []
    }

    this.nextQ = this.nextQ.bind(this);
    // this.lastQ = this.lastQ.bind(this);
    this.onChange = this.onChange.bind(this);
  }

  nextQ(e){
    e.preventDefault();

    // document.getElementById("back-button").style.visibility = "visible";

    // Loop or POST
    if(this.state.index < this.state.questions.length - 1){
      var next = this.state.index + 1;
      this.setState({
        index: next,
        currQuestion: this.state.questions[next].content,
        currAnswers: this.state.questions[next].answers
      });
    } else {
      ReactGA.event({
         category: 'App',
         action: 'Submit',
         transport: 'beacon'
       });
      const url = 'http://peermedia.io/strategy-builder/php/api.php';
      var rJSON = JSON.stringify(this.state.responses);
      axios.post(url, {responses: rJSON},
      {headers: {'Content-Type': 'application/json'}}).then(response => response.data)
        .then((data) => {
          this.props.resultHandler(data);
        });
    }
  }
  //
  // lastQ(e){
  //   e.preventDefault();
  //   if(this.state.index > 0){
  //     var last = this.state.index - 1;
  //     this.setState({
  //       index: last,
  //       currQuestion: this.state.questions[last].content,
  //       currAnswers: this.state.questions[last].answers
  //     });
  //   } else {
  //     document.getElementById("back-button").style.display = "none";
  //   }
  //
  // }

  onChange(e){
    var qid = this.state.questions[this.state.index].id;
    var aid = e.currentTarget.value;
    var responseItem = {qid: qid, aid: aid};
    var responses = this.state.responses;
    var didReplace = false;

    if(responses.length > 0){
      for (var i = 0; i <= responses.length - 1; i++){
        if(responses[i]['qid'] == qid){
          didReplace = true;
          responses[i] = responseItem;
        }
      }
      if(!didReplace){
        responses.push(responseItem);
      }
    } else {
      responses.push(responseItem);
    }
    this.setState({responses: responses})
    console.log(this.state.responses);
  }

  render(){
    var question = this.state.currQuestion;
    var questionNum = "q" + (this.state.index + 1).toString();
    var answers = this.state.currAnswers.map((item) => (
      <div key={item.id} className="single-answer">
        <input id={item.id} name={questionNum} type="radio" value={item.id} onChange={this.onChange}/>
        <label htmlFor={item.id}> {item.content}</label>
      </div>
    ));
    var buttonText = "Next";
    if(this.state.index == this.state.questions.length - 1){
      buttonText = "Submit";
    } else {
      buttonText = "Next";
    }

    /* only display back button if index > 0 */
    // if(this.state.index > 0){
    //   document.getElementById("back-button").style.visibiblity = "visible";
    // } else {
    //   document.getElementById("back-button").style.visibility = "hidden";
    // }

    return (
      <div id="question-container" className="container-main question">
        <form>
          <h1>
            {question}
          </h1>
          <div className="answers">
            {answers}
          </div>
          <button onClick={this.nextQ}>{buttonText}</button>
        </form>
      </div>
    );
  }
}

export default Question;
