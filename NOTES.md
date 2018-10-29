Runners (though not a model) can access the website without registering or logging in. They merely come to the site to gather information on running events and leave.

Organizers register and login/out. They can perform all the CRUD operations including delete. They have name, email, and password attributes.

Events have the following attributes: name, date, various racing attributes of boolean variety, contact information, and additional messaging.

Application controller has a root action that renders a welcome page. It also has actions for registration, login, and logout of organizers.

The organizers controller as well as the events controller have full CRUD actions.

A user will come to the welcome page for a  welcome message. If you are an event organizer you will be directed to either signup or login. Runners will be directed to an index of all events

Organizer signup will automatically log organizers in. After signup, organizers will be sent to an index page of that organizer's events with options to edit or delete. The edit option directs to an edit page. There will be an option to create a new event that directs to a new form.

Requested refactor following Sinatra assessment:

- Flesh out races such that they are stored in a table and have a many-to-many relationship to events.

-  Re-evaluate where you choose to render and where you choose to redirect. Keep in mind variables that are needed to render, but also the URL that users will see in the browser. Does it match what is being shown?

- Squash that signup bug! Test thoroughly to ensure that users are redirected (possibly seeing an error message) when attempting to sign up with a duplicate username/email.


