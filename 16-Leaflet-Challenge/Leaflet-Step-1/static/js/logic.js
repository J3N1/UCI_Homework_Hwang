// Store our API endpoint inside queryUrl
var queryUrl = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson";

// Create color function
function getColor(magnitude) {
  if (magnitude >= 5) {
      return 'darkred'
  } else if (magnitude >= 4) {
      return 'orange'
  } else if (magnitude >= 3) {
      return 'coral'
  } else if (magnitude >= 2) {
      return 'yellow'
  } else if (magnitude >= 1) {
      return 'greenyellow'
  } else {
      return 'chartreuse'
  }
};

//Create radius function
function getRadius(magnitude) {
  return magnitude * 20000;
};

// Perform a GET request to the query URL
d3.json(queryUrl, function(data) {
  // Once we get a response, send the data.features object to the createFeatures function
  createFeatures(data.features);
});

function createFeatures(earthquakeData) {

  // Define a function we want to run once for each feature in the features array
  // Give each feature a popup describing the place and time of the earthquake
  function onEachFeature(feature, layer) {
    layer.bindPopup("<h3>Magnitude: " + feature.properties.mag +"</h3><h3>Location: "+ feature.properties.place +
    "</h3><hr><p>" + new Date(feature.properties.time) + "</p>");
  };

  function pointToLayer(feature, latlng) {
    return new L.circle(latlng, {
      radius: getRadius(feature.properties.mag),
      fillColor: getColor(feature.properties.mag),
      fillOpacity: 0.5,
      color: "black",
      stroke: true, 
      weight: 0.8
    })
  };

  // Create a GeoJSON layer containing the features array on the earthquakeData object
  // Run the onEachFeature function once for each piece of data in the array
  var earthquakes = L.geoJSON(earthquakeData, {
    onEachFeature: onEachFeature,
    pointToLayer: pointToLayer
  });

  // Sending our earthquakes layer to the createMap function
  createMap(earthquakes);
}

function createMap(earthquakes) {

  // Define streetmap and darkmap layers
  var light = L.tileLayer("https://api.mapbox.com/styles/v1/mapbox/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 18,
  id: "light-v10",
  accessToken: API_KEY
  });

  // Define a baseMaps object to hold our base layers
  var baseMaps = {
    "Light Map": light,
  };

  // Create overlay object to hold our overlay layer
  var overlayMaps = {
    Earthquakes: earthquakes
  };

  // Create our map, giving it the streetmap and earthquakes layers to display on load
  var myMap = L.map("map", {
    center: [
      37.09, -95.71
    ],
    zoom: 5,
    layers: [light, earthquakes]
  });
  // Create color function
  function getColor(magnitude) {
    if (magnitude >= 5) {
        return 'darkred'
    } else if (magnitude >= 4) {
        return 'orange'
    } else if (magnitude >= 3) {
        return 'coral'
    } else if (magnitude >= 2) {
        return 'yellow'
    } else if (magnitude >= 1) {
        return 'greenyellow'
    } else {
        return 'chartreuse'
    }
  };
  
  //Create radius function
  function getRadius(magnitude) {
    return magnitude * 20000;
  };

  // Create a layer control
  // Pass in our baseMaps and overlayMaps
  // Add the layer control to the map
  L.control.layers(baseMaps, overlayMaps, {
    collapsed: false
  }).addTo(myMap);

  // Set up the legend
  var legend = L.control({ position: "bottomright" });
  legend.onAdd = function() {
    var div = L.DomUtil.create("div", "info legend");
    var limits = [0,1,2,3,4,5]
    var colors = ["chartreuse", "greenyellow","yellow","coral","orange","darkred"]
    var labels = ['0-1','1-2','2-3','3-4','4-5','5+'];

    // Add min & max
    var legendInfo = "<h2>Magnitude</h2>"

    div.innerHTML = legendInfo;

    limits.forEach(function(limit, index) {
      div.innerHTML += "<li style=\"background-color: " + colors[index] + "\">"+labels[index]+"</li>"
    });
    return div;
  };

  // Adding legend to the map
  legend.addTo(myMap);


};