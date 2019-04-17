import React, { Component } from "react";
import './App.css';
import axios from 'axios';

class AddMovie extends Component {

    constructor(props) {
        super(props);
        this.state = {
            ProducersValues: [],
            Movie: {},
            ActorsList:[]
        }
        this.onSaveClick.bind(this);
        this.GetDataForCascadingDropDown.bind(this);
        this.GetDataForProdcucersDropDown.bind(this);
        this.UploadFile.bind(this);
    }

    componentDidMount() {
        axios.get("https://localhost:44313/api/User")
        .then(response => {
            this.setState({
                ActorsList : response.data
            })
        })    
        axios.get("https://localhost:44313/api/User/GetAllProducers")
        .then(response => {
            this.setState({
                ProducersValues : response.data
            })
        })         
    }

    onClick() {
        window.location = '/Home';
    }

    onSaveClick = (e) => {
        debugger;
        let movieDTO = this.state.Movie;
        console.log(movieDTO);
        axios.post("https://localhost:44313/api/Movie",{headers:{'content-type':'application/json'}} ,
        {
            data : movieDTO            
        })
        .then(response => {
            alert(response.data);
        })
    }

    GetDataForCascadingDropDown = (e) => {
        //debugger;
        var options = e.target.options;
        var value = [];
        for (var i = 0, l = options.length; i < l; i++) {
            if (options[i].selected) {
            value.push(+options[i].value);
            }
        }
        this.state.Movie.LstActorIds = value;
        this.setState({
            Movie : this.state.Movie
        });
    }
    GetDataForProdcucersDropDown = (e)=>{
        this.state.Movie.ProducerId = +e.target.value;
        this.setState({
            Movie : this.state.Movie
        });
    }

    onActorClick() {
        window.location = '/Actor'
    }

    onProducerClick() {
        window.location = '/Producers';
    }

    UploadFile = (e) => {
        this.state.Movie.MPoster = e.target.files[0].name;
        this.setState({
            Movie:this.state.Movie
        });
    }
    MovieNameChange = (e)=>{
        this.state.Movie.MName = e.target.value;
        this.setState({
            Movie:this.state.Movie
        });
    }
    PlotChange = (e)=>{
        this.state.Movie.MPlot = e.target.value;
        this.setState({
            Movie:this.state.Movie
        });
    }
    YearOfReleaseChange=(e)=>{
        this.state.Movie.MYearOfRelease = e.target.value;
        this.setState({
            Movie:this.state.Movie
        });
    }
    render() {
        
        return (           
            <div id="AddMovie">
                <div className="leftButton" >
                    <a href='/Home'>Back</a>
                </div>
                <table>
                    <tr>
                        <td>Movie Name</td>
                        <td><input type="textbox" id='txtMovieName' onChange={this.MovieNameChange}></input></td>
                    </tr>
                    <tr>
                        <td>Plot</td>
                        <td><input type="textbox" id='txtPlot' onChange={this.PlotChange}></input></td>
                    </tr>
                    <tr>
                        <td>Year of Release</td>
                        <td><input type="textbox" id='txtYearOfRelease' onChange={this.YearOfReleaseChange}></input></td>
                    </tr>
                    <tr>
                        <td>Poster</td>
                        <td><input type="file" onChange={this.UploadFile}></input></td>
                    </tr>
                    <tr>
                        <td>Actors</td>
                        <td>
                             <select multiple id='ddlActors'                         
                                onChange={this.GetDataForCascadingDropDown}>
                                {this.state.ActorsList.map((op) => <option id={op.udName} value={op.udId}>{op.udName}</option>)}
                            </select>
                            
                        </td>
                        <td>
                            <div className="centerButton" >
                                <input type="button" value="Add New Actor" onClick={this.onActorClick}></input>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Prodcucers</td>
                        <td>
                            <select id='ddlProdcucers'                              
                                onChange={this.GetDataForProdcucersDropDown}>
                                <option id="-1" value="--Select--">--Select--</option>
                                {this.state.ProducersValues.map((op) => <option id={op.udName} value={op.udId}>{op.udName}</option>)}
                            </select>
                        </td>
                        <td>
                            <div className="centerButton" >
                                <input type="button" value="Add New Produser" onClick={this.onProducerClick}></input>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colSpan='2'>
                            <div className="centerButton" >
                                <input type="button" value="Save Movie Details" onClick={this.onSaveClick}></input>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        );
    }
}

export default AddMovie;