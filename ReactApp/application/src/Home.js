import React, { Component } from 'react';
import './App.css';
import { AgGridReact } from 'ag-grid-react';
import 'ag-grid-community/dist/styles/ag-grid.css';
import 'ag-grid-community/dist/styles/ag-theme-balham.css';
import axios from 'axios'

class Home extends Component {

    constructor(props) {
        super(props);

        this.state = {
            columnDefs: [
                { headerName: "Movie Name", field: "mName" },
                { headerName: "Year of Release", field: "mYearOfRelease" },
                { headerName: "Plot", field: "mPlot" },
                { headerName: "Poster", field: "mPoster" },
                { headerName: "Actors", field: "actorsName" },
                { headerName: "Producer", field: "producerName" }

            ],
            rowData: []
        }
    }

    componentDidMount() { 
        axios.get("https://localhost:44313/api/Movie",)
        .then(response => {
            this.setState({
                rowData : response.data
            })
        })  
    }

    onClick() {
        window.location = '/AddMovie';
    }
    render() {

        return (
            <div id="MovieList">
                <div className="leftButton" >
                    <input type="button" value="+ Add Movie" onClick={this.onClick}></input>
                </div>
                <div className="ag-theme-balham" style={{ height: '800px', width: '100%' }}>
                    <AgGridReact
                        columnDefs={this.state.columnDefs}
                        rowData={this.state.rowData}>
                    </AgGridReact>
                </div>
            </div>
        );
    }
}

export default Home;

