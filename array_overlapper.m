% This function overlaps every vector in a cell array with each other.
% Depends on the "music_note" and "overlapper" functions.

% Returns: final overlapped vector. This function returns a regular 1xn
% vector. It does not return a cell array.
% Inputs
% x: a column cell array. Must contain the notes this array overlaps. Each
% row in the cell array must be one musical note, based on the "music_note"
% function
% overlap: number of elements to overlap each array by (integer input)
function result = array_overlapper(x, overlap)

    if size(x, 1) == 1  % Base case in recursion
        result = cell2mat(x);
    elseif size(x, 1) == 2
        result = overlapper(x(1, :), x(2, :), overlap);
    else
        
        % Overlap first two vectors in the cell array
        overlapped = overlapper(x(1, :), x(2, :), overlap);
        % Split the cell array x starting from the third row
        x = x(3:end, :);
        % Recursive case
        result = overlapper(overlapped, array_overlapper(x, overlap),...
            overlap);
    end
    
end