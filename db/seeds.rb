hal = Organizer.create(name: 'Hal', email: 'hal@gmail.com', password: 'pass1')
iris = Organizer.create(name: 'Iris', email: 'iris@gmail.com', password: 'pass2')
jess = Organizer.create(name: 'Jess', email: 'jess@gmail.com', password: 'pass3')

event_1 = Event.create(name: 'Event1', date: '2018-11-01', races_string: 'five_k,half_marathon', organizer_id: 1)
event_2 = Event.create(name: 'Event2', date: '2018-12-01', races_string: 'five_k,half_marathon', organizer_id: 2)
event_3 = Event.create(name: 'Event3', date: '2019-01-01', races_string: 'marathon', organizer_id: 1)
event_4 = Event.create(name: 'Event4', date: '2019-02-01', races_string: 'five_k,marathon', organizer_id: 3)
event_5 = Event.create(name: 'Event5', date: '2019-03-01', races_string: 'five_k,half_marathon', organizer_id: 2)
