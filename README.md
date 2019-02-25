# WeLuvWine #
## Preamble ##

A certain San Carlos based Winery requires to gather thought and recollections about wine tastings in order to backfill their inventory and ramp up production to keep a good stock of the wines that are most popular with the tasters. Talking to some engineering friends, it occurred to them that a web based application would be ideal, so that people could take notes about the wines they had previously tasted, and evaluate and rank the ones the liked the most (or hated and never want to try again, you never know).

One of the engineers recommended you for the task, and you proposed to develop the site using responsive design and using ASP.NET Core Stack for the backend, but you were not quite sure about what technology you wanted to use for the UI. 


## Requirements ##

* The customers are coming up with many ideas, but after long sessions of coming back and forth, both parties have agreed on a set of functionalities fit for an MVP (minimum viable product).
* Wine tasters must be able to login to the application using at least one single sign-on provider (SSO)
* Wine tasters, can only log in if they’re register for the wine tasting session, this is coordinated externally to the system, via phone and email. And each taster receive an unique code (key) that mean they’ll be part of that tasting session via email. 
* Once they login, a wine taster, after careful deliberation and having received the required information from an enologist, will be able to rate a wine on the following aspects (with a scale of 1 to 5 starts (half stars are allowed):
    * Aromas, Flavors & Structure
    * Food-Friendliness (Soloist, Limited, Selective, Versatile, Impeccable)
    * Value (Overpriced, A Little Pricey, As Expected, Very Good, Exceptional).
    * Additionally they can submit Tasting Notes as a free text to provide additional feedback on the wine. 


 
## Additional considerations (Extra value if implemented) ##
* The enologist must be able to start and finish a wine tasting session.
* After a wine tasting the system must generate a report indicating the overall rating of the wines (based on the three criterias specified by the tasters) and signal the most popular ones.


## Suggested DB schema ##

__Wine__
WineId, ProductName, Country, Region, GrapeVarieties, Producer, Year, ABV(%), Description 

__User__
UserId, UserCode, email

__TastingSession__
TastingSessionId, SessionDate, SessionKey

__TastingSessionUser__
TastingSessionId, UserId, AttendedToSession

__TastingSessionWine__
TastingSessionId, WineId

__TastingSessionUserRate__
TastingSessionId, UserId, WineId, AromasFlavorsStructure, FoodFriendliness, Value, Notes.

## Instructions ##

Create both an API (using ASP .NET Core) and a Web facing application (feel free to use whatever stack you’re comfortable with) that enables the key requirements requested by the owners of the winery. 

Things we will be evaluating
* Adherence to best practices
* Code Standards
* Design patterns (usage, knowledge, implementation)
* Troubleshooting
* Industry standards (unit testing, IOC, Caching)
* Sarcasm 
* Cups of coffee consumed whilst developing this exercise.

We’re providing a suggested Database Design, feel free to modify it to suit your needs. You’re free to make changes and additions to the system, but keep in mind that the Winery owners won’t be happy if you deviate too much from their requirements. 

Please send your solution to hero-recruitment@schoolmint.net with the subject ___.NET Exercise - Full Name___, and attach the programming exercise as ___full-name-net.zip___
