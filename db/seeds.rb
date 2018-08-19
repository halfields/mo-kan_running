o_1 = Organizer.create(name: 'Hal', email: 'hal@gmail.com', password: 'pass1')
o_2 = Organizer.create(name: 'Iris', email: 'iris@gmail.com', password: 'pass2')
o_3 = Organizer.create(name: 'Jess', email: 'jess@gmail.com', password: 'pass3')

event_1 = Event.create(name: 'Event1', date: 'date1', races_string: 'five_k,half_marathon', organizer_id: 1)
event_2 = Event.create(name: 'Event2', date: 'date2', races_string: 'five_k,half_marathon', organizer_id: 2)
event_3 = Event.create(name: 'Event3', date: 'date3', races_string: 'marathon', organizer_id: 1)
event_4 = Event.create(name: 'Event4', date: 'date4', races_string: 'five_k,marathon', organizer_id: 3)
event_5 = Event.create(name: 'Event5', date: 'date5', races_string: 'five_k,half_marathon', organizer_id: 2)
