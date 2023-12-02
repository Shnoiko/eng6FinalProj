classdef Card
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here

    properties
        % NOTES for number property (obj.number)
        %   10 = pick two
        %   11 = skip
        %   12 = swap direction
        %   for wilds: 0 = wild, 1 = pick four

        encodedCardNumber;
        color;
        number;
        imageSource;
    end

    methods
        function obj = Card(encodedCardNumber)
            %CARD Construct an instance of this class
            %   the input encodedCardNumber identifies what type of card
            %   this instance of the class will be. 
            %0 = red 0      13 = blue 0     26 = yellow 0       
            %1 = red 1      14 = blue 1     27 = yellow 1
            %2 = red 2      15 = blue 2     28 = yellow 2
            % etc...        etc...          etc...
            %9 = red 9      22 = blue 9     35 = yellow 9
            %10 = red ptwo  23 = blue ptwo  36 = yellow ptwo
            %11 = red skip  24 = blue skip  37 = yellow skip
            %12 = red swap  25 = blue swap  38 = yellow swap
            %
            %
            %39 = green 0   52 = wild
            %40 = green 1   53 = pfour
            %41 = green 2
            %etc..
            %48 = green 9
            %49 = green ptwo
            %50 = green skip
            %51 = green swap

            %make sure encodedCardNumber is in the correct range
            if (encodedCardNumber > 53) | (encodedCardNumber < 0)
                error("input arg must be an integer less than or equal to 53")
            else
                obj.encodedCardNumber = encodedCardNumber;
                %assign the color and number according to the
                %encodedCardNumber
                if encodedCardNumber <= 12
                    obj.color = 'red';
                    obj.number = encodedCardNumber;
                elseif encodedCardNumber <= 25
                    obj.color = 'blue';
                    obj.number = encodedCardNumber - 13;
                elseif encodedCardNumber <= 38
                    obj.color = 'yellow';
                    obj.number = encodedCardNumber - 26;
                elseif encodedCardNumber <= 51
                    obj.color = 'green';
                    obj.number = encodedCardNumber - 39;
                else
                    obj.color = 'wild';
                    obj.number = encodedCardNumber - 52;
                end
                obj.imageSource = char("/UnoCards/" + string(obj.color) + string(obj.number) + ".png");
            end       
        end
    end
end