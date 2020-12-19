// from data.js
var tableData = data;

//Get a reference to the table body
var tbody = d3.select("tbody");

// //console.log the data from data.js
// console.log(data);

//UFO Sightings values for each column 
tableData.forEach((ufoSightings) => {
    //append one table row for each UFO Sighting object
    var row = tbody.append("tr");
    //use 'Object.entries' to grab each key and value set 
    Object.entries(ufoSightings).forEach(([key, value]) => {
        //Append a cell to the row for each value 
        var cell = row.append("td");
        //update each cell with UFO Sighting values
        cell.text(value);
    });
});

//Select the button
var button = d3.select("#filter-btn");
//Create event handlers
//Complete the event handler function for the form 
button.on("click", function() {
    //Add filtered sighting to table
    tbody.html("");
    //Select the input element and get the raw HTML node
    var inputElement = d3.select("#datetime");
    //Get the value property of the input element
    var inputValue = inputElement.property("value");
    //console.log input value
    console.log(inputValue);
    //filter data with datetime equal to input value
    var filteredData = tableData.filter(sighting => sighting.datetime === inputValue);
    //console.log filter values
    console.log(filteredData);

    filteredData.forEach(function(selections){
        console.log(selections);
        //append one table row for each UFO Sighting object
        var row = tbody.append("tr");
        //use 'Object.entries' to console.log each UFO Sighting value
        Object.entries(selections).forEach(function([key, value]){
            console.log(key, value);
            //Append a cell to the row for each value
            var cell = row.append("td");
            //update each cell with UFO Sighting values
            cell.text(value);
        });
    });
});
