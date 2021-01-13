//Set up chart parameters: height, width, margins
var svgWidth = 960;
var svgHeight = 500;

var margin = {
    top: 20,
    right: 40,
    bottom: 60,
    left: 100
};

var width = svgWidth - margin.left - margin.right;
var height = svgHeight - margin.top - margin.bottom;

//Create an SVG Wrapper/Container
var svg = d3.select(".scatter")
    .append("svg")
    .attr("width", svgWidth)
    .attr("height", svgHeight);

var chartGroup = svg.append("g")
    .attr("transform", `translate(${margin.left}, ${margin.top})`);

//Import Data
d3.csv("data/data.csv").then(function(healthData) {
    //Step 1: Parse Data/Cast as numbers
    data.forEach(function(data) {
        data.poverty = +data.poverty;
        data.healthcare = +data.healthcare;
    });
    //Step 2: Create Scale Functions
    
})