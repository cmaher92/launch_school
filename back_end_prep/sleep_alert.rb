# Sleep alert

status = ['awake', 'tired'].sample

alert = 'Be productive' if status == 'awake'
alert = 'Go to sleep!' if status == 'tired'

puts alert
