$blab.noGitHubRibbon = true;

new $blab.Canvas((canvas) -> 
	objects = new $blab.LanderAndImpact(canvas, (o) -> $blab.rayleigh?.waves(o.distance))
	$blab.lander = objects.lander
	$blab.impact = objects.impact
)

class SpeedSlider
	
	v: 4.2
	
	constructor: (@callback) ->
		
		@container = $ "#speedSlider"
		
		@container.slider
			#orientation: "vertical"
			range: "min"
			min: 0.1
			max: 10
			step: 0.1
			value: @v
			slide: (e, ui) => @setSpeed(ui.value)
			change: (e, ui) =>  # Unused because responds to slide method
		
		@setSpeed @v
		
	setSpeed: (@v) ->
		@setText @v
		@callback @v
		
	setText: (v) -> $("#speedText").html v+" km/s"
	
	# API
	set: (v) -> @container.slider("value", v)
	
new SpeedSlider (v) -> $blab.rayleigh?.setWaveSpeed(v)