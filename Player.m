classdef Player < handle
    
    %  This class creates a an object player which has multiple proporties
    %  listed below. 
    %

    properties
        playerHand; %The array of cards a player currently has
        playerHandLength; %The length of the players hand, to be passed
        playerNumber; %Number of the player for reference
   

    end

    methods
       
        function [obj] = Player(deck)
            % This function will create a player with the listed proporties
            % above
            %It will then create a hand with 7 random cards
           
            initialhand =  Card.empty(0, 7);
            %For loop assigns a card to each spot in the player hand
            for i = 1:7
                initialhand(i) = deck.pullCard();
            end
           obj.playerHand = initialhand;
           obj.playerHandLength = 7;
        end

        function [newArray] = addCard(obj, deck)
            
            % Function to add a card to the array
            % When calling this cuntion dont need to provide any inputs
            %It will return the new array after the card has been added

            obj.playerHand(end + 1) = deck.pullCard();

            newArray = obj.playerHand;
            
        
        end
        function [newArray] = remoCard(obj, index)
            % Function to remove a card from the array
            % When calling this function, must provide the index of the
            % card being played
            %It will return the new array after the card has been added
          
            obj.playerHand(index) = [];
            newArray = obj.playerHand;
            
        
        end
        function [newlength] = givelength(obj)
            % This function will return the length of players hand
            %No input necessary
            obj.playerHandLength = length(obj.playerHand);
            newlength = obj.playerHandLength;
        end
    end
end