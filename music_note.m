% This function generates a musical note of a certain duration and then
% pauses for 0.0625 seconds

% Returns: a vector of the music note
% Inputs
% note: the name of the note (string value)
% count: how many counts the note should be sustained (int value)
% ADSR: whether or not ADSR functionality should be enabled (boolean value)
function music = music_note(note, count, ADSR)
    
    Fs = 8000;  % Sampling rate
    pause = 0.0625 * Fs;  % Pause for 0.0625
    key_set = {'A_L','Bb', 'B', 'C','Db','D','Eb','E','F','Gb','G','Ab',...
                'A_H'};  % Accounts for octave of A
    value_set = [1, 2^(1/12), 2^(2/12), 2^(3/12), 2^(4/12), 2^(5/12), ...
    2^(6/12), 2^(7/12), 2^(8/12), 2^(9/12), 2^(10/12), 2^(11/12), 2] .* 220;
    
    % Map note name to the corresponding frequency
    M = containers.Map(key_set, value_set);
    duration = 0 : (count * 4000) - 1;  % 4000 samples for 1 count
    
    if ADSR == true
        
        % Create ADSR envelope
        A = linspace(0, 1, (count * 4000) * 0.05);
        D = linspace(1, 0.8, (count * 4000) * 0.1);
        S = linspace(0.8, 0.8, (count * 4000) * 0.7);
        R = linspace(0.8, 0, (count * 4000) * 0.15);
    
        ADSR = [A, D, S, R];
        
        music = [cos(2*pi*(M(note)/Fs)*duration).*ADSR, zeros(1, pause)];

    else
        music = [cos(2 * pi * (M(note)/Fs) * duration), zeros(1, pause)];
    end
end