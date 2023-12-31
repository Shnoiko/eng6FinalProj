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
            %39 = green 0   52 = wild   54 = wild red
            %40 = green 1   53 = pfour  55 = wild blue
            %41 = green 2               56 = wild yellow
            %etc..                      57 = wild green
            %48 = green 9               58 = pfour red
            %49 = green ptwo            59 = pfour blue
            %50 = green skip            60 = pfour yellow
            %51 = green swap            61 = pfour green

            %make sure encodedCardNumber is in the correct range
            if (encodedCardNumber > 61) || (encodedCardNumber < 0)
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
                elseif encodedCardNumber <= 53
                    obj.color = 'wild';
                    obj.number = encodedCardNumber - 52;
                else
                    %special case for wild cards that have been placed
                    obj.number = 'wild';
                    if encodedCardNumber == 54
                        obj.color = 'red';
                        obj.imageSource = '/UnoCards/wildred.png';
                    elseif encodedCardNumber == 55
                        obj.color = 'blue';
                        obj.imageSource = '/UnoCards/wildblue.png';
                    elseif encodedCardNumber == 56
                        obj.color = 'yellow';
                        obj.imageSource = '/UnoCards/wildyellow.png';
                    elseif encodedCardNumber == 57
                        obj.color = 'green';
                        obj.imageSource = '/UnoCards/wildgreen.png';
                    elseif encodedCardNumber == 58
                        obj.color = 'red';
                        obj.imageSource = '/UnoCards/wildp4red.png';
                    elseif encodedCardNumber == 59
                        obj.color = 'blue';
                        obj.imageSource = '/UnoCards/wildp4blue.png';
                    elseif encodedCardNumber == 60
                        obj.color = 'yellow';
                        obj.imageSource = '/UnoCards/wildp4yellow.png';
                    elseif encodedCardNumber == 61
                        obj.color = 'green';
                        obj.imageSource = '/UnoCards/wildp4green.png';
                    end
                end
                if encodedCardNumber < 54
                    obj.imageSource = char("/UnoCards/" + string(obj.color) + string(obj.number) + ".png");
                end
            end       
        end
    end
end