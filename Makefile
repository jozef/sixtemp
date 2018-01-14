all: README

README: sixtemp_sensor.ino
	pod2readme $< README
