import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class Start extends Component {
  constructor(props) {
    super(props);
  }

  render(){
    return (
      <div id="start" className="container-main">
        <h1>Build a Product Marketing Strategy</h1>
        <hr />
        <p>Get a basic product marketing strategy in just 5 minutes.</p>
        <button onClick={this.props.start}>Start</button>
      </div>
    );
  }
}

export default Start;
