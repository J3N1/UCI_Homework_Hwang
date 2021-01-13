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
    var xLinearScale = d3.scaleLinear()
        .domain([20, d3.max(healthData, d => d.poverty)])
        .range([0, width]);
    
    var yLinearScale = d3.scaleLinear()
        .domain([0, d3.max(healthData, d => d.healthcare)])
        .range([height, 0]);
    //Step 3: Create axis functions
    var bottomAxis = d3.axisBottom(xLinearScale);
    var leftAxis = d3.axisLeft(yLinearScale);
    //Step 4: Append Axes to the chart
    chartGroup.append("g")
        .attr("transform", `translate(0, ${height})`)
        .call(bottomAxis);
    chartGroup.append("g")
        .call(leftAxis);
    //Step 5: Create Circles
    var circlesGroup = chartGroup.selectAll("circle")
        .data(healthData)
        .enter()
        .append("circle")
        .attr("cx", d => xLinearScale(d.poverty))
        .attr("cy", d => yLinearScale(d.healthcare))
        .attr("r", "15")
        .attr("fill", "lightblue")
        .attr("opacity", ".5");
    //State abbreviations
    chartGroup.selectAll("text")
        .data(healthData)
        .enter()
        .append("text")
        .attr("x", (d,i) => xLinearScale(d.poverty))
        .attr("y", d=> (yScale(d.healthcare-0.28)))
        .attr("fill", "white")
        .text(d => d.abbr);
    //Create Axes Labels
})