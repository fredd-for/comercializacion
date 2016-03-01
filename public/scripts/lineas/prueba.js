$(document).ready(function (){
	
	$('#gaugeContainer1').jqxGauge({
		ranges: [
		{ startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
		{ startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
		{ startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
		],
		ticksMinor: { interval: 5, size: '5%' },
		ticksMajor: { interval: 10, size: '9%' },
		value: 0,
		// width: '40%',
  //       height: '80%',
		colorScheme: 'scheme05',
		animationDuration: 1200
	});
	$('#gaugeContainer1').on('valueChanging', function (e) {
		$('#gaugeValue1').text(Math.round(e.args.value) + ' %');
	});
	$('#gaugeContainer1').jqxGauge('value', 21);




	$('#gaugeContainer2').jqxGauge({
		ranges: [
		{ startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
		{ startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
		{ startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
		],
		ticksMinor: { interval: 5, size: '5%' },
		ticksMajor: { interval: 10, size: '9%' },
		value: 0,
		// width: '40%',
  //       height: '80%',
		colorScheme: 'scheme05',
		animationDuration: 1200
	});
	$('#gaugeContainer2').on('valueChanging', function (e) {
		$('#gaugeValue2').text(Math.round(e.args.value) + ' %');
	});
	$('#gaugeContainer2').jqxGauge('value', 56);





	$('#gaugeContainer3').jqxGauge({
		ranges: [
		{ startValue: 0, endValue: 40, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 10, startWidth: 1 },
		{ startValue: 40, endValue: 80, style: { fill: '#fbd109', stroke: '#fbd109' }, endWidth: 15, startWidth: 10 },
		{ startValue: 80, endValue: 100, style: { fill: '#4bb648', stroke: '#4bb648' }, endWidth: 20, startWidth: 15 }
		],
		ticksMinor: { interval: 5, size: '5%' },
		ticksMajor: { interval: 10, size: '9%' },
		value: 0,
		// width: '40%',
  //       height: '80%',
		colorScheme: 'scheme05',
		animationDuration: 1200
	});

	$('#gaugeContainer3').on('valueChanging', function (e) {
		$('#gaugeValue3').text(Math.round(e.args.value) + ' %');
	});

	$('#gaugeContainer3').jqxGauge('value', 98);
	

})