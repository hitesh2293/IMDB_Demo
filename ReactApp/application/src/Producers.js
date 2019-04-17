import React, { Component } from "react";
import './App.css';
import axios from 'axios';

class Producer extends Component {

    constructor(props) {
        super(props);
        this.state = {
            UserDetails: { UdUserType: 2 }
        }
        this.onSaveClick.bind(this);
        this.GetDataForDropDown.bind(this);
        this.ProducerNameChange.bind(this);
        this.BioChange.bind(this);
        this.DOBChange.bind(this);
    }

    componentDidMount() {
    }

    onSaveClick = (e) => {
        //debugger;
        let userDetailsDTO = this.state.UserDetails;
        //console.log(userDetailsDTO);

        axios.post("https://localhost:44313/api/User", { headers: { 'content-type': 'application/json' } },
            {
                data: userDetailsDTO
            })
            .then(response => {
                //debugger;
                alert(response.data);
            })
    }

    GetDataForDropDown = (e) => {
        //debugger;
        this.state.UserDetails.UdSex = e.target.value;
        this.setState({
            UserDetails: this.state.UserDetails
        });
    }

    ProducerNameChange = (e) => {
        //debugger;
        this.state.UserDetails.UdName = e.target.value;
        this.setState({
            UserDetails: this.state.UserDetails
        });
    }

    BioChange = (e) => {
        //debugger;
        this.state.UserDetails.UdBio = e.target.value;
        this.setState({
            UserDetails: this.state.UserDetails
        });
    }

    DOBChange = (e) => {
        //debugger;
        this.state.UserDetails.DateOfBirth = e.target.value;
        this.setState({
            UserDetails: this.state.UserDetails
        });
    }

    render() {

        return (
            <div id="AddUser">
                <div className="leftButton" >
                    <a href='/AddMovie'>Back</a>
                </div>
                <table>
                    <tr>
                        <td>Producer Name</td>
                        <td><input type="textbox" id='txtActorName' onChange={this.ProducerNameChange}></input></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <select onChange={this.GetDataForDropDown}>
                                <option id="Select" value="-1">--Select--</option>
                                <option id="Male" value="1">Male</option>
                                <option id="Female" value="2">Female</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><input type="textbox" id='txtDOB' onChange={this.DOBChange} placeholder='MM/dd/YYYY'></input></td>
                    </tr>
                    <tr>
                        <td>Bio</td>
                        <td>
                            {/* <input type="textarea" multiple id='txtBio' onChange={this.BioChange}></input> */}
                            <textarea rows="5" cols="50" id='txtBio' onChange={this.BioChange} placeholder='Entry Actor Bio' name="description">
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colSpan='2'>
                            <div className="centerButton" >
                                <input type="button" value="Save Producer Details" onClick={this.onSaveClick}></input>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        );
    }
}

export default Producer;