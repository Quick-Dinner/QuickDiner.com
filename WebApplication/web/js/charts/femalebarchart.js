


window.onload = function () {
   
var chart2 = new CanvasJS.Chart("femalechart", {
	animationEnabled: true,
	
	title:{
		text:"Female Preferences"
	},
	axisX:{
		interval: 1
	},
	axisY2:{
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: ""
	},
	data: [{
		type: "bar",
		name: "",
		axisYType: "secondary",
		color: "#014D65",
		dataPoints: [
			{ y: parseInt(document.getElementById('pizza_f').value), label: "pizza" },
			{ y: parseInt(document.getElementById('chicken_f').value), label: "chicken" },
			{ y: parseInt(document.getElementById('burger_f').value), label: "Burger" },
			{ y: parseInt(document.getElementById('drinks_f').value), label: "Juice" },
			
			
		]
	}]
});
chart2.render();

	
var chart1 = new CanvasJS.Chart("malechart", {
	animationEnabled: true,
	
	title:{
		text:"male Preferences"
	},
	axisX:{
		interval: 1
	},
	axisY2:{
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: ""
	},
	data: [{
		type: "bar",
		name: "",
		axisYType: "secondary",
		color: "#014D65",
		dataPoints: [
			{ y: parseInt(document.getElementById('pizza_m').value), label: "pizza" },
			{ y: parseInt(document.getElementById('chicken_m').value), label: "chicken" },
			{ y: parseInt(document.getElementById('burger_m').value), label: "Burger" },
			{ y: parseInt(document.getElementById('drinks_m').value), label: "Juice" },
			
			
		]
	}]
});
chart1.render();



var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title:{
		text: "Preferences by Region"
	},
	axisY: {
		title: "Products"
	},
	legend: {
		cursor:"pointer",
		itemclick : toggleDataSeries
	},
	toolTip: {
		shared: true,
		content: toolTipFormatter
	},
	data: [{
		type: "bar",
		showInLegend: true,
		name: "pizza",
		color: "gold",
		dataPoints: [
			{ y: parseInt(document.getElementById('pizza_n').value), label: "northern" },
			{ y:  parseInt(document.getElementById('pizza_w').value), label: "western" },
			{ y:  parseInt(document.getElementById('pizza_e').value), label: "eastern" },
			{ y:  parseInt(document.getElementById('pizza_c').value), label: "central" },
			
		]
	},
	{
		type: "bar",
		showInLegend: true,
		name: "chicken",
		color: "blue",
		dataPoints: [
			{ y:  parseInt(document.getElementById('chicken_n').value), label: "northern" },
			{ y:  parseInt(document.getElementById('chicken_w').value), label: "western" },
			{ y:  parseInt(document.getElementById('chicken_e').value), label: "eastern" },
			{ y:  parseInt(document.getElementById('chicken_c').value), label: "central" },
			
		]
	},
	{
		type: "bar",
		showInLegend: true,
		name: "burgers",
		color: "silver",
		dataPoints: [
			{ y:  parseInt(document.getElementById('burger_n').value), label: "northern" },
			{ y:  parseInt(document.getElementById('burger_w').value), label: "western" },
			{ y:  parseInt(document.getElementById('burger_e').value), label: "eastern" },
			{ y:  parseInt(document.getElementById('burger_c').value), label: "central" },
			
		]
	},
	{
		type: "bar",
		showInLegend: true,
		name: "drinks",
		color: "#A57164",
		dataPoints: [
			{ y:  parseInt(document.getElementById('drinks_n').value), label: "northern" },
			{ y:  parseInt(document.getElementById('drinks_w').value), label: "western" },
			{ y:  parseInt(document.getElementById('drinks_e').value), label: "eastern" },
			{ y:  parseInt(document.getElementById('drinks_c').value), label: "central" },
			
		]
	}]
});
chart.render();

function toolTipFormatter(e) {
	var str = "";
	var total = 0 ;
	var str3;
	var str2 ;
	for (var i = 0; i < e.entries.length; i++){
		var str1 = "<span style= 'color:"+e.entries[i].dataSeries.color + "'>" + e.entries[i].dataSeries.name + "</span>: <strong>"+  e.entries[i].dataPoint.y + "</strong> <br/>" ;
		total = e.entries[i].dataPoint.y + total;
		str = str.concat(str1);
	}
	str2 = "<strong>" + e.entries[0].dataPoint.label + "</strong> <br/>";
	str3 = "<span style = 'color:Tomato'>Total: </span><strong>" + total + "</strong><br/>";
	return (str2.concat(str)).concat(str3);
}

function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	}
	else {
		e.dataSeries.visible = true;
	}
	chart.render();
}



}



