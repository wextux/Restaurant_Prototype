== Restaurant iPad Menu App Server

This is my first stab at a Ruby on Rails application. The point of the application is to host a Menu Designer application that will sync with the partner iPad application. You will be able to manage your restaurants with this web application such as adding menus, menu items, new restaurants, menu Devices. 


== The Basic Idea

When a group arrives at a restaurant they will be given an iPad that is logged into the rails application. The guests can then view the different Menu types by choosing the different tabs at the bottom of the app. There will be a UITableView that will list the Menu Items for the given menu type. The guest can then add the meals that they would like into the order and then push that order off to the kitchen when they are ready. 

The kitchen will have a computer that is logged into the Rails application where they can view the orders coming in. Any special request that are made from the iPad Menu can be viewed by the Cooks in the kitchen.

A Waiter iPhone/iPod Touch iOS app will be partnered with a couple of iPad menus that way the waiter can receive Apple Push notifications from the tables he is watching so the guest don't need to wait for the waiter to be free to ask him for something like 'more pepper'. 



== Technical Details

1. All details are stored on Basecamp at http://boneyardinteractive.basecamphq.com/

2. iPad app uses the rails natural RESTfulness to GET/POST/DELETE/PUT data between the server and the iOS app, using the ASIHTTPRequest package from https://github.com/pokeb/asi-http-request

3. iPad will have use a UITableView within a UITabView to show all the menu items. Each Tab will be a menu type such as, Breakfast, Lunch, Dinner, Wine


== Ideas

* Add Push notification support to allow guests using the menu app to be able to make request such as "Refill my root beer". This request will be POSTed to the rails application and the rails application will then send off an Apple Push notification to the matching iOS waiter application for their table. 
