import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import jsPDF from 'jspdf';

class Results extends Component {
  constructor(props) {
    super(props);

    this.state = {
      results: this.props.list
    }
  }

  render(){
    console.log(this.state.results);
    var allResults = this.state.results;
    var compArray = [];
    var mustHaveArray = [];
    var specArray = [];
    var considerArray = [];

    for(var i = 0;i < allResults.length; i++){
      if(allResults[i]["category"] === "compadv"){
        compArray.push(allResults[i]);
        console.log(compArray);
      }
      if(allResults[i]["category"] === "musthave"){
        mustHaveArray.push(allResults[i]);
      }
      if(allResults[i]["category"] === "special"){
        specArray.push(allResults[i]);
      }
      if(allResults[i]["category"] === "consider"){
        considerArray.push(allResults[i]);
      }
    }

    return (
      <div id="results" className="result-container">
        <h1>Your Custom Product Marketing Strategy</h1>
        <CompAdv array={compArray}/>
        <MustHave array={mustHaveArray}/>
        <Considers array={considerArray}/>
        <Special array={specArray}/>
        <Restart />
      </div>
    );
  }
}

class MustHave extends Component {
  constructor(props) {
    super(props);
  }

  render(){
    var array = this.props.array;

    var display = array.map((item) => (
      <div key={item.title} className="result-item">
        <h3>{item.title}</h3>
        <div dangerouslySetInnerHTML={{__html: item.content}}></div>
      </div>
    ));
    return(
      <div>
          <h2>These are <b>must-haves</b>.</h2>
        <div className="result-section">
          {display}
        </div>
      </div>
    );
  }
}

class Considers extends Component {
  constructor(props){
    super(props);
  }

  render(){
    var array = this.props.array;
    if(array.length > 1){
      var header = "Consider these additional channels:";
    } else if (array.lenth = 1){
      var header = "Consider this as well:";
    }

    var display = array.map((item) => (
      <div key={item.title} className="result-item">
        <h3>{item.title}</h3>
        <div dangerouslySetInnerHTML={{__html: item.content}}></div>
      </div>
    ));

    if(array.length > 0){
      return(
        <div>
          <h2>{header}</h2>
          <div className="result-section">
            {display}
          </div>
        </div>
      );
    } else {
      return(null);
    }
  }
}

class CompAdv extends Component {
  constructor(props) {
    super(props);
  }

  render(){
    var array = this.props.array;

    if(array.length == 0){
      return(null);
    }
    return(
      <div className="result-section">
        <div id="compadv" className="result-item">
          <h3>Your competitive advantage is <b>{array[0]["title"]}!</b></h3>
          <div id="compadv-content" dangerouslySetInnerHTML={{__html: array[0]["content"]}}></div>
        </div>
      </div>
    );
  }
}

class Special extends Component {
  constructor(props) {
    super(props);
  }

  render(){
    var array = this.props.array;
    if(array.length > 1){
      var header = "Special Considerations";
    } else if (array.lenth = 1){
      var header = "Special Consideration";
    }

    var display = array.map((item) => (
      <div className="result-item" key={item.title}>
        <h3>{item.title}</h3>
        <div dangerouslySetInnerHTML={{__html: item.content}}></div>
      </div>
    ));

    if(array.length > 0){
      return(
        <div>
          <h2>{header}</h2>
          <div className="result-section">
            {display}
          </div>
        </div>
      );
    } else {
      return(null);
    }
  }
}

class Restart extends Component {
  constructor(props){
    super(props);
  }

  restart(){
    window.location.reload();
  }

  render(){
    return(
      <div className="result-section">
        <div className="result-item">
          <h3>Want to try again?</h3>
          <button onClick={this.restart}>Restart</button>
        </div>
      </div>
    );
  }
}

export default Results;
