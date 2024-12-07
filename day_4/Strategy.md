
Four forwards
Four Backwards
Four Up
Four Down
Four diagonal
    Up right
    up left
    down right
    down left

Find all X's
    For each direction where there are 4 characters
        Look for X M A S
            If XMAS - Add to counter

X_position.each |x,y|
    Possible_directions(x,y).each |direction|
        xmas(x,y,direction) ? counter +=1 : next
    end
end


Finding X's:
    Can just to a scan and return positions?

Checking for directions:
    Forwards: 
        Is x position <= than length of row - 3?
    Backwards:
        is x position >= 3?
    Up
        is y position <= length of array - 3?
    Down
        is y position >= 3?

    Diagonal....

        Up forwards
            Is x position <= than length of row - 3?
            
        Up backwards

        Down forwards

        Down backwards



    
    [x,m,a,s,y]
    [x,m,a,s,y]
    [x,m,a,s,y]
    [x,m,a,s,y]