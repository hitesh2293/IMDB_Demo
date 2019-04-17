import React, { Component } from 'react';
import './App.css';
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";
import home from "../src/Home";
import AddMovie from "../src/AddMovie";
import Actor from './Actor';
import Producers from './Producers';


class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <h2>IMDB Demo</h2>
        </header>
        <div className="mainContent">
          <Router>
            <Switch>
              <Route exact path="/" component={home} />
              <Route exact path="/Home" component={home} />
              <Route exact path="/AddMovie" component={AddMovie} />
              <Route exact path="/Actor" component={Actor} />
              <Route exact path="/Producers" component={Producers} />
            </Switch>
          </Router>
        </div>
      </div>
    );
  }
}

export default App;
