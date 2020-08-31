% This function overlaps two row vectors

% Returns: overlapped vector. Final vector is of length
% len(x) + len(y) - overlap
% Inputs
% x, y: vectors to be overlapped (vector input)
% overlap: amount of overlap (integer value)

function result = overlapper(x, y, overlap)
    
    if iscell(x)
        x = cell2mat(x);
        y = cell2mat(y);
    end

    % Pad the end of x with zeroes
    x1 = [x, zeros(1, length(y) - overlap)];
    
    % Pad the beginning of y with zeroes
    y1 = [zeros(1, length(x) - overlap), y];
    result = x1 + y1;
    
end