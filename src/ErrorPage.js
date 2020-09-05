import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class ErrorPage extends Component {
  constructor(props) {
    super(props);
  }

  restart(){
    window.location.reload();
  }

  render(){
    return (
      <div id="start" className="container-main">
        <h1>There was a problem building your strategy.</h1>
        <hr />
        <p>Want to try again?</p>
        <button onClick={this.restart}>Restart</button>
      </div>
    );
  }
}

export default ErrorPage;
