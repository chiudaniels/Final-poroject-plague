# Final-Project-Plague
APCS Spring Semester Final Project
Project Description:
To create a plague/plandemic game, where given a world map, the player can try to infect and kill off the human race with a disease he/she creates. 

Directions: 

Our game is a knockoff version of Plague. The controls are pretty simple, as the player doesn't really have much to do, other than choose where to start the disease, and whenever he wants, he can upgrade the disease.

Our algorithim for growing is based on a 2D array of integers. So if an element had a value of -10, it'd be extremely immune, while a country with a value of 10 would be suffering the worse strain of the disease. 

The grow algorithim has a possibility of spreading outwards, increasing the severity of regions already infected, or decreasing the severity of regions already infected (due to advancements in medicine and so forth). 

The algorithim also scans the edges of the 2D array, and when it has reached a sufficient amount of infected, it will spread to a neighboring country. 

Neighboring countries were selected based upon amount of trade done between each country, as well as geographic location. So while Australia and Greenland might both be very isolated geographically, since both countries trade with others, they do have a sufficient amount of neighbors. 

For our display, we made our own SVG files to help each individual region have its own color and shape, to prevent blocky manipulations of color. 

We have a second window, which displays the last clicked country's information. 

You select a country by clicking on the red circle in the middle of the country. 

Our upgrade screen gives you two options, transmission between animals and transmission in countries. 

Transmission across animals will increase the effectiveness of our disease's ability to cross borders and infect other countries/regions of the same country. 

Our reasoning behind this is that that is how it works in the actual Plague game, which makes sense logically as well. Animals can go past borders with relatively low interference. No one will stop a sick pigeon from flying from one country to the next. But a sick person will be much more likely to be stopped if he is traveling between countries. 

The next upgrade is transmission inside countries, which will increase the severity of the disease inside all countries it has currently infected.  

Thank you for reading, and have fun!


Changelog:
5-13 Brian: Github's branching not working on desktop app, still experimenting with it. 

5-14 Daniel: Looked through possible libraries, decided unfoldingmaps is probably the most useful. 

5-15 Brian: Gave up on branching for now, will try to use it at another time. 

5-15 Brian and Daniel: Tried using the unfolding maps interface, and since it only works on Processing 2.0, searched up other possible map libraries. 

5-16 Daniel: Experimented using SVG files for PShapes as an alternative to importing a library. 

5-17 Brian: Downloaded processing 2.0  to try to use unfolding maps, but ultimately not that useful for this project.

5-17 Daniel: Downloaded processing 2.0 to try to use unfolding maps, but ultimately not that useful for this project. 

5-17 Daniel: Made SVG file for North America (USA and Canada). 

5-18 Daniel: Started the country class, and did some more work on main final project file. 

5-18 Brian: Continued basic work on the final project file, very basic and just rudimentary setup stuff. 

5-19 Brian: Started the setup function for the project, tried experimenting with different resolutions. Settled on 1600 by 900.

5-19 Daniel: Made another two SVG files(Europe and MiddleEast). 

5-20 Daniel: Made australia SVG file using photoshop and other tools. 

5-20 Brian: Made disease class, also put in background image of world map from Plague Inc. screenshot. 

5-21 Daniel: Made greenland SVG, having trouble with colors in SVG files, looking for a solution. 

5-21 -> 5-22 Brian: Added more to country class, including basic probablitiy grow algorithim

5-22 Daniel: Starts idea of implementing a 2D-Array for grow method. Made two more SVG files, planning to have a total of 10 at this point. 

5-23 Daniel: Finishes remaining SVG files, total of 10 now. Full world domination. 

5-23 Brian: Puts loops and colors for Demo presentation.  

5-24 Brian: Moves unnecessary methods of Disease over to that of the Country class.

5-24 Daniel: Put all necessary constructors, instance variables, and methods into Country for now. 

5-25 Brian: Starts implementing new grow method in the country class, using Daniel's 2D Array idea.

5-25 Daniel: Starts exploring the idea of a second window for upgrades/info.  

5-26 Brian: Finished basic grow method, might expand with more possibilities based on how the game plays so it will be more balanced. 

5-26 Daniel: Resized map resolution and country places for school computer. 

5-27 Brian: Started implementing neighbors function in Country class. Started making probability of spreading higher/game balancing. Also started population/getSum functions. 

5-27 Daniel: Improved the setup and draw function, moving from PShapes to country class. 

5-28 Brian: Made extra methods in country class to return info relevant to the info screen or color of country. 

5-28 Daniel: Started using G4P library to make second window. 

5-29 Brian: Improved growing method to contain more elements. 

5-29 Daniel: Made second window, not finished, still trying to put upgrades in there. 

5-30 Brian: Finished grow method, contains more possibilities, and the possibility of upgrades. 

5-30 Daniel: Trying to put upgrades in the main window, the second window might be too difficult. 

5-31 Brian: Finished putting the concept of neighbors into each country. 

5-31 Daniel: Finished making upgrade screen in the main window, but not actually useful yet. 

6-1 Daniel: Tried experimenting with different lethality algorithims, none work in conjunction with our grow algorithim. 

6-1 Brian: Tried putting the idea of immunity/preventitive measures against the disease. 

6-2 Brian: Put another instance variable in grow method, started working on lethality. 

6-2 Daniel: Fixed bug with countries displaying colors meant for another country. 

6-3 Brian: Failed to find a sufficiently complicated kill method. 

6-4 Daniel: Put selection of countries available, helps with info screen and starting the game off. 

6-5 Brian: Put country info/population for each country into the info screen. 

6-5 Daniel: Completely finished upgrade screen in the main window, with 2 categories. 

6-6 Brian: Found error in getPercentage function, and tried to balance the game. 

6-6 Daniel: Fixed error that occurred with wrong country colors again, and put start message and finishing touches on the project. 