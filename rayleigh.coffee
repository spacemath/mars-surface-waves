class Rayleigh
    
    D: 3390  # Mars diameter
    v: 4.2  # Speed of surface wave (km/s)
    
    # Rayleigh waves
    waves: (d) ->
        C = @circumference()
        R1 = @set 1, d
        R2 = @set 2, C - R1.d
        R3 = @set 3, R1.d + C
        R4 = @set 4, R2.d + C
        R5 = @set 5, R3.d + C
        R6 = @set 6, R4.d + C
    
    # Mars circumference
    circumference: -> 2*pi*@D
    
    # Wave travel time
    time: (d) -> d/@v/60
    
    # Set Rayeligh wave n for distance d
    set: (n, d) ->
        R = {d: d, t: @time(d)}
        @disp "R#{n}d", R.d
        @disp "R#{n}t", R.t
        R
        
    # Display value in page
    disp: (id, x) ->
        $("##{id}").html(Math.round x)

$blab.rayleigh = new Rayleigh
