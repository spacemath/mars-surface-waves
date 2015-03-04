$blab.noGitHubRibbon = true;

class Rayleigh
	
	constructor: ->
		
	setDist: (d) ->
		$("#distance2").html(d)

rayleigh = new Rayleigh

new $blab.Canvas((canvas) -> 
	objects = new $blab.LanderAndImpact(canvas, (o) -> rayleigh.setDist(o.distance))
	$blab.lander = objects.lander
	$blab.impact = objects.impact
)