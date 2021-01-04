//Function for Data Plotting
function getPlot(id){
    //getting data from the json file
    d3.json("../../samples.json").then((data)=>{
        console.log(data);

        var wfreq = data.metadata.map(d => d.wfreq)
        console.log(`Washing Freq: ${wfreq}`);

        //filter sample values by id
        var samples = data.samples.filter(s => s.id.toString() === id)[0];
        console.log(samples);
    });
};