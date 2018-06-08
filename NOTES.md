This application is a clearing-house for information regarding running events in the Missouri-Kansas area. There are two models: organizer and event.

Runners (though not a model) can access the website without registering or logging in. They merely come to the site to gather information on running events and leave.

Organizers register and login/out. They can perform all the CRUD operations including delete. They have name, email, and password attributes.

Events have the following attributes: name, date, an array of races, contact information, and additional messaging.

Application controller has a root action that renders a welcome page. It also has actions for registration, login, and logout of organizers.

The organizers controller as well as the races controller have full CRUD actions.
