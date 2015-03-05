$blab.noGitHubRibbon = true;

# Initialize
$blab.rayleigh = {waves: (d) ->}

new $blab.Canvas((canvas) -> 
	objects = new $blab.LanderAndImpact(canvas, (o) -> $blab.rayleigh.waves(o.distance))
	$blab.lander = objects.lander
	$blab.impact = objects.impact
)