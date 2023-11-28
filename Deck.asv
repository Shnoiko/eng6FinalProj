classdef Deck
    %DECK creates and shuffles the deck of cards for uno
    %requires the class Card to function
    %NOTE:
    %   when the end of a deck is reached, the next card drawn will be the
    %   first card. The deck will not reshuffle.

    properties
        %deckArray is a 1x108 array which contains instances of class Card
        %
        %topCard is a number one through 108 which indicates which card
        %will be drawn next
        deckArray;
        topCard;
    end

    methods
        function obj = Deck()
            %Creates the array of cards deckArray and shuffles it.
            %
            %The 2 for loops serve to put the correct cards in the deck for
            %a game of uno.
            %
            %Remember that Card(i) creates a card. i corresponds to the
            %type of card that is created.

            obj.topCard = 1;
            
            for i = 0:53
                deckArray(i+1) = Card(i);
            end
            j = 0;
            for i = [1:12, 14:25, 27:38, 40:53, 52:53, 52:53]
                deckArray(55 + j) = Card(i);
                j = j + 1;
            end
            %shuffle the deck using randperm
            obj.deckArray = deckArray(randperm(length(deckArray)));
            
        end

        function [pulledCard, obj] = pullCard(obj)
            %YOU MUST ALWAYS HAVE THE DECK OBJECT AS AN OUTPUT
            %   When calling this function you will have 2 outputs, the
            %   pulled card and the Deck object. In order to incriment the
            %   value of obj.topCard, we must reassign this value every
            %   time we call the method

            %get the top card from deckArray
            pulledCard = obj.deckArray(obj.topCard);
            
            %if topCard greater than 108, set to one, otherwise incriment
            %by 1
            if obj.topCard >= 108
                obj.topCard = 1;
            else
                obj.topCard = obj.topCard + 1;
            end
        end
    end
end