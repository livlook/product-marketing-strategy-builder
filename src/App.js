import React, { Component } from 'react';
import Question from './Question.js';
import Start from './Start.js';
import Results from './Results.js';
import ErrorPage from './ErrorPage.js';
import logo from './logo.svg';
import './App.css';
import axios from 'axios';
import ReactGA from 'react-ga';
ReactGA.initialize('UA-146632069-2');
ReactGA.pageview(window.location.pathname + window.location.search);

// class App
class App extends Component {
  constructor(props){
    super(props);

    this.state = {
      hasError: false,
      hasStarted: false,
      hasResults: false,
      questions: [],
      results: []
    }

    this.start = this.start.bind(this);
    this.resultHandler = this.resultHandler.bind(this);
  }

  componentDidMount(){
    const url = 'http://peermedia.io/strategy-builder/php/api.php';
    axios.get(url).then(response => response.data)
    .then((data) => {
      this.setState({questions: data});
      console.log(data);
    });
  }

  componentDidCatch(error, info){
    this.setState({hasError: true});
  }

  start(e){
    e.preventDefault();
    this.setState({hasStarted: true});
    ReactGA.event({
     category: 'App',
     action: 'Start',
     transport: 'beacon'
   });
  }

  resultHandler(results){
    this.setState({results: results});
  }

  render(){
    if(this.state.hasError === true){
      return(
        <div className="App-main">
          <ErrorPage/>
        </div>
      )
    } else {
      if (!this.state.hasStarted && this.state.results.length == 0){
        return(
          <div className="App-main">
            <Start start={this.start}/>
          </div>
        );
      } else if (this.state.hasStarted && this.state.results.length == 0){
        return(
          <div className="App-main">
            <Question list={this.state.questions} resultHandler={this.resultHandler}/>
          </div>
        );
      } else if (this.state.results.length > 0) {
        return(
          <div className="App-main">
            <Results list={this.state.results}/>
          </div>
        );
      }
    }
  }
}

export default App;
